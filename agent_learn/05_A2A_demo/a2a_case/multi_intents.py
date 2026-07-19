# 步骤1：导入所需的库和模块
import asyncio  # 导入 asyncio 库，用于实现异步和并发操作
from python_a2a import AgentNetwork, AIAgentRouter, A2AClient, Task, Message, MessageRole, TextContent # 从 python_a2a 库导入 Agent 协作所需的核心类和对象
from langchain_openai import ChatOpenAI  # 导入 LangChain 的 ChatOpenAI，用于与大语言模型交互
from langchain_core.prompts import PromptTemplate  # 导入 LangChain 的 PromptTemplate，用于定义提示模板
from langchain_core.output_parsers import StrOutputParser  # 导入 LangChain 的 StrOutputParser，用于解析 LLM 输出为字符串
import json  # 导入 json 库，用于处理 JSON 格式的数据
import uuid  # 导入 uuid 库，用于生成唯一的任务 ID
from time import sleep  # 导入 sleep 函数，用于模拟处理延迟
from agent_learn.config import Config # 导入自定义的 Config 类，用于加载配置信息
import re  # 导入 re 模块，用于正则表达式处理

# 步骤2：初始化配置和LLM
# 2.1 从配置文件加载配置
conf = Config()

# 2.2 配置 LLM 用于分解查询
decompose_llm = ChatOpenAI(
    model=conf.model_name,
    api_key=conf.api_key,
    base_url=conf.base_url,
    temperature=0.1,
    streaming=True  #启用流式处理
)

# 2.3 定义分解查询的提示模板
decompose_prompt = PromptTemplate.from_template(""" 
将以下用户查询分解为独立的子查询，每个子查询对应一个单一意图。 
返回 JSON 格式的列表：{{"sub_queries": ["子查询1", "子查询2", ...]}}
示例：
查询: "预订票,查天气"
输出: {{"sub_queries": ["预订票", "查天气"]}}
查询: {query}
""")

# 2.4 构建分解链
decompose_chain = decompose_prompt | decompose_llm | StrOutputParser()


# 步骤3：主函数，执行多意图协作流程
async def main():
    # 3.1 创建 AgentNetwork
    network = AgentNetwork(name="TravelAgentNetwork")

    # 3.2 添加专家代理到网络中
    network.add("TicketAgent", "http://127.0.0.1:5009")  # 添加票务代理的名称和URL
    network.add("WeatherAgent", "http://127.0.0.1:5008")  # 添加天气代理的名称和URL

    # 3.3 打印网络初始化信息
    print("[主控日志] AgentNetwork 初始化完成，已添加代理：")
    for agent_info in network.list_agents():
        print(json.dumps(agent_info, indent=4, ensure_ascii=False))
    print("-" * 50)

    # 3.4 创建 AIAgentRouter
    router = AIAgentRouter(
        llm_client=A2AClient("http://localhost:5555"),
        agent_network=network  # 将 AgentNetwork 实例传递给路由器，以便它能知道有哪些 Agent 可用
    )

    # 3.5 定义测试查询列表（包括多意图）
    queries = [
        "帮我查下北京的天气",
        "预订一张从北京到上海的火车票",
        "预订一张从北京到上海的火车票,查询一下北京天气"  # 多意图查询
    ]

    # 3.6 循环处理每个查询
    for query in queries:
        print(f"[主控日志] 用户查询: '{query}'")

        # 3.7 使用 LLM 分解查询为子查询
        try:
            decompose_response = decompose_chain.invoke({"query": query})  # 调用分解链，将查询传给LLM进行分解
            print(f'decompose_response-->{decompose_response}')
            # 使用正则表达式清理LLM输出中的JSON标记
            decompose_response = re.sub(r'^```json\n|\n```$', '', decompose_response.strip())
            decompose_data = json.loads(decompose_response)
            # 从JSON中获取子查询列表，如果失败则使用原始查询
            sub_queries = decompose_data.get("sub_queries", [query])
        except Exception as e:
            print(f"[主控日志] 分解错误: {str(e)}，使用原始查询")
            sub_queries = [query]  # 发生错误时，将原始查询作为唯一的子查询
        print(f"[主控日志] query分解子任务结果: {sub_queries}")

        # 3.8 收集子查询任务
        tasks = []  # 创建一个空列表，用于存放所有要并行执行的异步任务
        agent_names = []  # 创建一个空列表，用于记录每个任务对应的Agent名称
        confidences = []  # 创建一个空列表，用于记录路由的置信度
        for sub_query in sub_queries:  # 遍历所有分解出的子查询
            agent_name, sub_confidence = router.route_query(sub_query)  # 调用路由器，为每个子查询选择最合适的Agent
            print(f"[主控日志] 子查询 '{sub_query}' 路由结果: {agent_name} (置信度: {sub_confidence})")
            if agent_name and sub_confidence >= 0.5:  # 如果找到合适的Agent且置信度足够高
                agent_client = network.get_agent(agent_name)  # 从网络中获取该Agent的客户端实例
                if agent_client:
                    message = Message(  # 创建一个A2A消息对象
                        content=TextContent(text=sub_query),
                        role=MessageRole.USER
                    )
                    task = Task(  # 创建一个A2A任务对象
                        id="task-" + str(uuid.uuid4()),
                        message=message.to_dict()
                    )
                    # 记录所有task：因为没有使用 await，那么这个异步函数不会被执行，会返回一个未被处理的协程对象，但里面的代码不会运行
                    tasks.append(agent_client.send_task_async(task))
                    agent_names.append(agent_name)
                    confidences.append(sub_confidence)

        # 3.9 计算整体置信度
        confidence = sum(confidences) / len(confidences) if confidences else 0.1
        print("===========所有子查询置信度的平均值==============")
        print(confidence)

        # 3.10 并行执行任务
        if tasks:
            # 使用 asyncio.gather 并行执行所有任务，并收集结果
            results = await asyncio.gather(*tasks, return_exceptions=True)
            print("[主控日志]检查query拆解任务之后的所有 任务结果:")
            print(results)

            # 3.11 处理和打印任务结果
            for i, result in enumerate(results):
                if isinstance(result, Exception):  # 检查结果是否是异常（任务执行失败）
                    print(f"[主控日志] {agent_names[i]} 处理错误: {str(result)}")
                else:  # 任务成功完成
                    print(f"[主控日志] {agent_names[i]} 收到完整响应：")
                    print(json.dumps(result.to_dict(), indent=4, ensure_ascii=False)) # 格式化打印完整的A2A任务响应

                    # 3.12 解析 artifacts 中的 parts
                    print(f"\n[主控日志] {agent_names[i]} 解析 artifacts 中的 parts：")
                    for artifact in result.artifacts:
                        if "parts" in artifact:  # 检查是否存在 parts 字段
                            for part in artifact["parts"]:
                                part_type = part.get("type")  # 获取 part 的类型
                                if part_type == "text":
                                    print(f"Text 结果: {part.get('text')}")
                                elif part_type == "error":
                                    print(f"Error 消息: {part.get('message')}")
                                elif part_type == "function_response":  # 如果类型是函数响应
                                    print(f"Function Response: name={part.get('name')}, response={part.get('response')}")
                                else:  # 其他未知类型
                                    print(f"未知类型: {part}")
        else:  # 如果任务列表为空
            print("[主控日志] 未找到合适代理")

        print("-" * 50)
        sleep(1)  # 暂停1秒，避免请求过快


# 步骤4：程序入口
if __name__ == "__main__":
    # 请确保 ticket_agent.py 和 weather_agent.py 正在运行...
    asyncio.run(main())
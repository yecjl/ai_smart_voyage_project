"""
mcp-stdio传输方式-客户端-agent自动调用tools

Author: danke
Date: 2026/7/14 19:51
"""
import asyncio

from langchain.agents import create_tool_calling_agent, AgentExecutor
from langchain_core.prompts import ChatPromptTemplate
from langchain_mcp_adapters.tools import load_mcp_tools
from langchain_openai import ChatOpenAI
from mcp import ClientSession, StdioServerParameters
from mcp.client.stdio import stdio_client

from SmartVoyage.config import Config

conf = Config()

# 创建模型
llm = ChatOpenAI(base_url=conf.base_url,
                 api_key=conf.api_key,
                 model=conf.model_name,
                 temperature=0.1)

# 配置mcp服务器脚本路径
server_script = r"./server_stdio.py"

# 配置mcp服务器启动参数
server_params = StdioServerParameters(
    command="python" if server_script.endswith(".py") else "node",
    args=[server_script],
)

# 定义mcp客户端
mcp_client = None

# 主要的异步函数run_agent
async def run():
    global mcp_client
    # 启动 MCP server，并通过标准输入输出建立异步连接。
    async with stdio_client(server_params) as (read, write):
        # 使用读写通道创建 MCP 会话。
        async with ClientSession(read, write) as session:
            await session.initialize()
            # 动态创建一个临时类 MCPClientHolder，把 session 放进去。这样就可以在函数外部通过 mcp_client.session 调用 MCP 工具
            mcp_client = type("MCPClientHolder", (), {"session": session})()

            # 从 session 自动获取 MCP server 提供的工具列表。
            tools = await load_mcp_tools(session)
            print(f"tools-->{tools}")

            # 修改不是直接用 调用 MCP server 的 get_weather 工具, 改成
            # response = await session.call_tool("get_weather", arguments={})
            # print(f"response-->{response}")

            # 创建prompt模板
            prompt_template = ChatPromptTemplate.from_messages([
                ("system", "你是一个乐于助人的助手，能够调用工具回答用户问题。"),
                ("human", "{input}"),
                ("placeholder", "{agent_scratchpad}"), # 占位符，用于后续插入工具调用结果, Langchain会自动填入的, 不写会失去上记忆
            ])

            # 构建工具调用代理
            agent = create_tool_calling_agent(llm, tools, prompt_template)

            # 创建代理执行器
            agent_executor = AgentExecutor(agent=agent, tools=tools, verbose=True)

            # 代理调用
            print("MCP客户端启动，输入'quit'退出")
            while True:
                # 接收用户查询
                query = input("\nQuery: ").strip()
                if query.lower() == "quit":
                    # 发送用户查询给代理，并打印
                    break
                try:
                    response = await agent_executor.ainvoke({"input": query})
                    print(f"response-->{response}")
                except Exception:
                    print("解析有问题")

    return

# 启动运行
if __name__ == "__main__":
    asyncio.run(run())
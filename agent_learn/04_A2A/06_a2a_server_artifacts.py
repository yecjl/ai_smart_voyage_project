"""
A2A服务端
A2AServer是A2A协议的核心实现类，用于 构建代理服务器 。
它继承自BaseA2AServer，支持 处理任务 （handle_task）、 消息 （handle_message）和 路由设置 （setup_routes）。它管理任务存储、流式订阅，并支持Google A2A兼容模式。
它提供了Flask路由支持、任务处理逻辑和错误处理，确保代理间通信的可靠性。

task:
在继承 A2AServer 的情况下，会有一个task，通常不需要手动创建 Task 对象，因为 A2AServer 的内置机制会自动处理传入的请求并将其解析为 Task 对象，传递给 handle_task 方法。
handle_task : handle_task用于解析任务输入、处理查询、封装结果并返回task任务对象。

artifacts:
artifacts 是 A2A 协议中 Task 对象的核心字段之一，用于存储任务执行后的输出产物（结果）。该字段为一个列表，每个元素代表一个产物对象，通常以字典形式呈现，并包含 "parts" 键，指向由多个内容片段组成的列表。
作为任务结果的结构化容器，artifacts 支持多种类型的数据（如文本内容、函数调用结果或错误信息），从而保证客户端能够准确解析并有效利用代理生成的输出。
"""
from python_a2a import A2AServer, run_server, AgentCard, AgentSkill, TaskStatus, TaskState

# 定义代理卡片
ticket_card = AgentCard(
    name="TicketAgentServer",
    description="票务代理",
    url="http://127.0.0.1:5010",
    skills=[AgentSkill(name="book_ticket", description="预订票务")]
)

# 自定义 A2AServer 子类
class TicketServer(A2AServer):
    def __init__(self):
        super().__init__(agent_card=ticket_card)

    def handle_task(self, task):
        print("收到A2A任务的task:=>", task)
        #默认写法：获取任务内容
        # Task(
        #   id='a50f2381-e890-4e89-b461-c913f3cd4ccb',
        #   session_id='0bfaea44-5118-4009-897a-09f2a5d74712',
        #   status=TaskStatus(state=<TaskState.SUBMITTED: 'submitted'>, message=None, timestamp='2026-02-01T17:42:10.886472'),
        #   message={'content': {'text': '查询天气', 'type': <ContentType.TEXT: 'text'>}, 'role': 'user', 'message_id': 'cf3216e8-e49d-4d28-8c24-0df32b08422f'},
        #   history=[],
        #   artifacts=[], # 客户端把任务task给到服务端，服务端完成任务后需要把结果放到artifacts里面。
        #   metadata={}
        # )
        query = (task.message or {}).get("content", {}).get("text", "")

        if "上海" in query and "北京" in query:
        # 这里的结果可以来自于 MCP 模块，这里我们直接模拟结果
            train_result = "上海到北京的火车票已经预订成功！  G1001,10车1A "
        else:
            train_result = "请输入明确的出发地和目的地。"

        task.artifacts = [{"parts": [{"type": "text", "text": train_result}]}]
        task.status = TaskStatus(state=TaskState.COMPLETED)
        print(f"[{self.agent_card.name} 日志] 任务处理完毕")
        print(f"[{self.agent_card.name} 日志] 输出结果task: {task}")
        print(f"[{self.agent_card.name} 日志] 输出结果task.artifacts: {task.artifacts}")
        return task

# 启动服务器
if __name__ == "__main__":
    server = TicketServer()
    print(f"[{server.agent_card.name}] 启动成功，服务地址: {server.agent_card.url}")
    run_server(server, host="127.0.0.1", port=5010, debug=True)
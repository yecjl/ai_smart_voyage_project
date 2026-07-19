"""
Task 是一个具有明确状态的实体，由 Client Agent 创建并发起，其状态由 Server Agent 负责维护和更新。每个 Task 都旨在实现一个特定的目标或结果。
在 Task 的执行过程中，Client Agent 和 Server Agent 通过交换 Message 进行通信，而 Server Agent 执行任务后生成的输出结果被称为 Artifact。Artifact会被封装到Task中.
此外，每个 Task 都拥有一个唯一的 sessionId。多个 Task 可以共享同一个 sessionId，这表明这些 Task 属于同一个会话（Session）的一部分，便于管理和跟踪相关任务的执行流程。
"""
from python_a2a import Task, Message, MessageRole, TextContent

# 创建任务
message = Message(content=TextContent(text="查询天气"), role=MessageRole.USER)
task = Task(message=message.to_dict())
print(task)

# Task(
#   id='a50f2381-e890-4e89-b461-c913f3cd4ccb',
#   session_id='0bfaea44-5118-4009-897a-09f2a5d74712',
#   status=TaskStatus(state=<TaskState.SUBMITTED: 'submitted'>, message=None, timestamp='2026-02-01T17:42:10.886472'),
#   message={'content': {'text': '查询天气', 'type': <ContentType.TEXT: 'text'>}, 'role': 'user', 'message_id': 'cf3216e8-e49d-4d28-8c24-0df32b08422f'},
#   history=[],
#   artifacts=[], # 客户端把任务task给到服务端，服务端完成任务后需要把结果放到artifacts里面。
#   metadata={}
# )
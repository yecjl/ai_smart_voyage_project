"""
TaskStatus 表示 A2A 任务的当前状态对象，包括状态枚举（TaskState）、附加消息和时间戳。它用于跟踪任务进度，支持序列化和格式转换，是任务处理的动态表示。
TaskStatus 依赖 TaskState。每个 TaskStatus 实例必须有一个 TaskState 作为其 state 字段。
"""
from python_a2a import TaskStatus, TaskState

status_completed = TaskStatus(
    state=TaskState.COMPLETED,
    message={"info": "任务成功完成"}
)

status_failed = TaskStatus(
    state=TaskState.FAILED,
    message={"error": "无法处理请求"}
)

# 打印字典表示
print("完成状态：", status_completed.to_dict())
print("失败状态：", status_failed.to_dict())

# 完成状态： {'state': 'completed', 'timestamp': '2026-02-01T17:49:47.711505', 'message': {'info': '任务成功完成'}}
# 失败状态： {'state': 'failed', 'timestamp': '2026-02-01T17:49:47.711505', 'message': {'error': '无法处理请求'}}
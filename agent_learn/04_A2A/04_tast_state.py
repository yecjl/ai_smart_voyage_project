"""
TaskState任务状态枚举类，TaskState 是一个枚举类，定义了任务的可能状态，如提交（SUBMITTED）、完成（COMPLETED）、失败（FAILED）等。
它是任务生命周期的基础，用于确保状态一致性和可读性。

TaskState 状态表格：
状态名称	值	中文描述
SUBMITTED	submitted	任务已提交，等待处理。
WAITING	waiting	任务正在等待，例如等待外部资源或输入。
INPUT_REQUIRED	input-required	任务需要额外用户输入以继续执行。
COMPLETED	completed	任务已成功完成，结果可用。
CANCELED	canceled	任务被取消，未完成执行。
FAILED	failed	任务执行失败，可能包含错误信息。
UNKNOWN	unknown	未知状态，通常用于处理无效或未识别的状态。

tips：
状态名称：TaskState 枚举的成员名称（例如 TaskState.SUBMITTED），用于代码中的类型安全引用。 值：枚举的字符串值（例如 "submitted"），
用于序列化（如 JSON）或与外部系统交互。 中文描述：每个状态的作用和场景，帮助开发者理解其在任务生命周期中的意义。
"""
from python_a2a import TaskState  # 只需相关导入
# 检查任务状态
if TaskState.COMPLETED == "completed":
    print("任务完成")
state = TaskState.SUBMITTED
print("转换后的状态值：", state.value)
print(state)
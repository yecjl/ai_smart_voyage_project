"""
AgentSkill描述代理的具体能力或功能模块，例如处理特定任务的技能。
它包括技能名称、描述、示例、输入/输出模式等。在A2A协议中，技能是代理卡片（AgentCard）的组成部分，用于细粒度服务发现。支持扩展标签和示例，便于代理间匹配调用。
"""
from python_a2a import  AgentSkill
# 定义一个代理技能
ticket_skill = AgentSkill(
    name="book_ticket",
    description="预订火车票的技能",
    examples=["预订从上海到北京的火车票"],
    input_modes=["text/plain"],  # text/html
    output_modes=["text/plain"]
)

print(ticket_skill)
print(ticket_skill.to_dict())

# AgentSkill(name='book_ticket', description='预订火车票的技能', id='f616bf0b-c86a-4492-bcd8-5c111c3cdd2b', tags=[], examples=['预订从上海到北京的火车票'], input_modes=['text/plain'], output_modes=['text/plain'])
# {'id': 'f616bf0b-c86a-4492-bcd8-5c111c3cdd2b', 'name': 'book_ticket', 'description': '预订火车票的技能', 'tags': [], 'examples': ['预订从上海到北京的火车票'], 'inputModes': ['text/plain'], 'outputModes': ['text/plain']}
"""
AgentCard是A2A协议中Agent代理的元数据描述卡片，用于代理发现和服务注册。它包含代理的名称、描述、URL、版本、技能列表、能力（如流式传输支持）和输入/输出模式等信息。
AgentCard允许其他代理或系统查询和调用该代理的服务，是A2A生态系统的入口点。在源码中，它支持序列化为JSON格式，便于网络传输。
元数据：描述数据的数据
AgentCard 是 Server Agent 的名片，它主要描述了 Server Agent 的能力、认证机制等信息。Client Agent通过获取不同 Server Agent 的 AgentCard，
了解不同 Server Agent 的能力，来决断具体的任务执行应该调用哪个 Server Agent 。
"""
from python_a2a import AgentCard, AgentSkill
# 创建一个代理技能
ticket_skill = AgentSkill(
    name="book_ticket",
    description="预订火车票的技能",
    examples=["预订从上海到北京的火车票"],
    input_modes=["text/plain"],
    output_modes=["text/plain"]
)
# 创建代理卡片
agent_card = AgentCard(
    name="TicketAgent",
    description="一个可以预订票务的代理",
    url="http://127.0.0.1:5009",
    version="1.0.0",
    skills=[ticket_skill],
    capabilities={"streaming": True}
)
# 打印代理卡片的字典表示（用于序列化）
print(agent_card)
print(agent_card.to_dict())
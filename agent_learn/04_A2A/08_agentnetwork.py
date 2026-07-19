"""
AgentNetwork 是 A2A 协议中的agent网络管理类，用于集中管理和发现 A2A代理。它维护一个代理列表，支持通过 URL 或客户端实例添加代理，并缓存代理的元数据（如 AgentCard）。
作用：
简化多代理协作，提供 add、get_agent、list_agents 和 discover_agents 等方法，支持代理发现和移除。适用于构建分布式代理系统，避免手动管理多个客户端。
核心特性：
● 添加代理：通过 add 方法，支持 URL（自动创建 A2AClient）或现有客户端。
● 代理元数据：自动缓存 AgentCard，便于查询代理能力。
● 发现代理：通过 discover_agents 从 URL 列表自动添加有效代理。
● 扩展性：支持头信息（headers）和异常处理。
"""
from python_a2a import AgentNetwork
# 实例化一个 agentNetwork
network = AgentNetwork(name="MyNetwork")
# 添加一个agent，这个agent注册到了这个networt
network.add("TicketAgent", "http://127.0.0.1:5010")
# network.add("TicketAgent", "http://127.0.0.1:5009")

print(f"agent network-->{network.agent_cards}")
print('*'*80)

# 调用
client = network.get_agent("TicketAgent")
print(client.ask("预订一张从北京到上海的火车票"))
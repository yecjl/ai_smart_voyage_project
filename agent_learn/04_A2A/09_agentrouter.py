"""
AIAgentRouter 是使用 LLM 智能路由查询到合适代理的类，定义在 router.py 中。它分析查询意图和上下文，选择最佳代理。
作用：
在多代理网络中，路由用户查询到最匹配的代理，支持语义分析、历史上下文和缓存。响应格式为代理名称和置信度，避免手动选择代理。
核心特性：
● LLM 驱动：使用 LLM 客户端（如 ChatOpenAI）生成路由提示，分析查询匹配代理描述和技能。
● 上下文支持：包含对话历史（max_history_tokens 限制令牌数）。
● 缓存优化：类似查询使用缓存减少 LLM 调用。
● 回退机制：LLM 失败时，使用关键词匹配回退路由。
● 系统提示：自定义提示指导路由决策。
"""
from python_a2a import AIAgentRouter, AgentNetwork
from langchain_openai import ChatOpenAI

from SmartVoyage.config import Config

conf=Config()

# 创建网络
network = AgentNetwork(name="MyNetwork")
network.add("TicketAgent", "http://127.0.0.1:5010")

# 创建模型
llm = ChatOpenAI(base_url=conf.base_url,
                 api_key=conf.api_key,
                 model=conf.model_name,
                 temperature=0.1)

# 创建路由器
router = AIAgentRouter(llm_client=llm, agent_network=network)
agent_name, confidence = router.route_query("预订票")
print(agent_name, confidence)
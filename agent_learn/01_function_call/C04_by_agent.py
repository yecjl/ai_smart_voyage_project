"""
Function Call demo4 - Agent 调用 tool
Agent = 大模型 + 任务规划（Planning） + 使用外部工具执行任务（Tools&Action） + 记忆（Memory）

Author: danke
Date: 2026/7/14 15:09
"""
from langchain.agents import initialize_agent, AgentType
from langchain_core.tools import tool
from langchain_openai import ChatOpenAI

from SmartVoyage.config import Config

config = Config()


# todo: 第一步：定义工具函数
# 工具的描述就是文档注释
@tool
def add(a: int, b: int) -> int:
    """
    将数字a与数字b相加
    Args:
        a: 第一个数字
        b: 第二个数字
    """
    return a + b


@tool
def multiply(a: int, b: int) -> int:
    """
    将数字a与数字b相乘
    Args:
        a: 第一个数字
        b: 第二个数字
    """
    return a * b


# 定义 JSON 格式的工具 schema
tools = [add, multiply]

# todo: 第二步：初始化模型
llm = ChatOpenAI(base_url=config.base_url,
                 api_key=config.api_key,
                 model=config.model_name,
                 temperature=0.1)

# todo: 第三步：创建Agent
agent = initialize_agent(tools, llm, agent=AgentType.STRUCTURED_CHAT_ZERO_SHOT_REACT_DESCRIPTION, verbose=True)

# todo: 第四步：调用Agent
query = "2+1等于多少？"

result = agent.invoke({'input':query})
print(f'result: {result["output"]}')

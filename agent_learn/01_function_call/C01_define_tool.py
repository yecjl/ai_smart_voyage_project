"""
Function Call demo1 - JSON 格式的工具 schema

Function Call: 用户向AI应用提出问题，大模型判断是否需要调用工具，然后将工具及需要的参数交给AI应用，由AI应用负责完成工具的执行，
并把结果给到大模型，大模型基于问题与结果返回自然语言给用户。

Author: danke
Date: 2026/7/14 11:43
"""
from langchain_core.messages import HumanMessage, ToolMessage
from langchain_openai import ChatOpenAI

from SmartVoyage.config import Config

config = Config()


# todo: 第一步：定义工具函数
def add(a: int, b: int) -> int:
    """
    将数字a与数字b相加
    Args:
        a: 第一个数字
        b: 第二个数字
    """
    return a + b


def multiply(a: int, b: int) -> int:
    """
    将数字a与数字b相乘
    Args:
        a: 第一个数字
        b: 第二个数字
    """
    return a * b

# 定义 JSON 格式的工具 schema
tools = [
    {
        "type": "function",
        "function": {
            "name": "add",     # 工具名称：重要
            "description": "将数字a与数字b相加",    # 工具描述：大模型根据这个决定是否调用该函数
            "parameters": {
                "type": "object",
                "properties": {
                    "a": {
                        "type": "integer",
                        "description": "第一个数字"
                    },
                    "b": {
                        "type": "integer",
                        "description": "第二个数字"
                    }
                },
                "required": ["a", "b"]
            }
        }
    },
    {
        "type": "function",
        "function": {
            "name": "multiply",
            "description": "将数字a与数字b相乘",
            "parameters": {
                "type": "object",
                "properties": {
                    "a": {
                        "type": "integer",
                        "description": "第一个数字"
                    },
                    "b": {
                        "type": "integer",
                        "description": "第二个数字"
                    }
                },
                "required": ["a", "b"]
            }
        }
    }
]

# todo: 第二步：初始化模型
llm = ChatOpenAI(base_url=config.base_url,
                 api_key = config.api_key,
                 model = config.model_name,
                 temperature=0.1)

# 绑定工具，允许模型自动选择工具
llm_with_tools = llm.bind_tools(tools, tool_choice="auto")

# todo: 第三步：调用回复
query = "2+1等于多少?"
messages = [HumanMessage(query)] # 短期记忆, 基于内存

try:
    # todo: 第一次调用
    ai_msg = llm_with_tools.invoke(messages)
    messages.append(ai_msg)
    print(f"\n第一轮调用后结果：\n{messages}")

    # 处理工具调用
    # 判断消息中是否有tool_calls，以判断工具是否被调用
    if hasattr(ai_msg, 'tool_calls') and ai_msg.tool_calls:
        for tool_call in ai_msg.tool_calls:
            # todo: 处理工具调用
            selected_tool = {"add": add, "multiply": multiply}[tool_call["name"].lower()]
            tool_output = selected_tool(**tool_call["args"])
            messages.append(ToolMessage(content=tool_output, tool_call_id=tool_call["id"]))
        print(f"\n第二轮  message中增加tool_output 之后：\n{messages}")

        # todo: 第二次调用，将工具结果传回模型以生成最终回答
        final_response = llm_with_tools.invoke(messages)
        print(f"\n最终模型响应：\n{final_response.content}")
    else:
        print("模型未生成工具调用，直接返回文本:")
        print(ai_msg.content)
except Exception as e:
    print(f"模型调用失败: {str(e)}")


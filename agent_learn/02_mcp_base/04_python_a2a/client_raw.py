"""
mcp-a2a传输方式-客户端-直接调用tools

Author: danke
Date: 2026/7/16 11:57
"""
import asyncio
from python_a2a import MCPClient

# MCP server URL for streamable connection
server_url = "http://127.0.0.1:8010"


# 主要的异步函数run_agent
async def run():
    # 定义mcp客户端
    client = MCPClient(server_url)

    # 步骤 1：获取可用工具列表
    tools = await client.get_tools()
    for tool in tools:
        print(f"- {tool.get('name', '未知')}: {tool.get('description', '无描述')}")

    # 调用 MCP server 的 get_weather 工具
    response = await client.call_tool("get_weather")
    print(f"response-->{response}")


# 启动运行agent
if __name__ == "__main__":
    asyncio.run(run())

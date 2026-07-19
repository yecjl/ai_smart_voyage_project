"""
mcp-streamable传输方式-客户端-直接调用tools

Author: danke
Date: 2026/7/16 11:57
"""
import asyncio
from mcp import ClientSession
from langchain_mcp_adapters.tools import load_mcp_tools
from mcp.client.streamable_http import streamablehttp_client

# MCP server URL for streamable connection
server_url = "http://127.0.0.1:8001/mcp"

# 定义mcp客户端
mcp_client = None

# 主要的异步函数run_agent
async def run():
    global mcp_client
    # 启动 MCP server，通过 streamable 建立异步连接。
    async with streamablehttp_client(url=server_url) as (read, write, _):
        # 使用读写通道创建 MCP 会话
        async with ClientSession(read, write) as session:
            await session.initialize()
            # 动态创建一个临时类 MCPClientHolder，把 session 放进去。这样就可以在函数外部通过 mcp_client.session 调用 MCP 工具
            mcp_client = type("MCPClientHolder", (), {"session": session})()

            # 从 session 自动获取 MCP server 提供的工具列表。
            tools = await load_mcp_tools(session)
            print(f"tools-->{tools}")

            # 调用 MCP server 的 get_weather 工具
            response=await session.call_tool("get_weather", arguments={})
            print(f"response-->{response}")


# 启动运行agent
if __name__ == "__main__":
    asyncio.run(run())
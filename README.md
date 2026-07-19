# 创建虚拟环境，python版本:
conda create -n lang_env python=3.12

# 激活环境
conda activate lang_env

#安装项目依赖
pip install -r requirements.txt --index-url https://pypi.tuna.tsinghua.edu.cn/simple --extra-index-url https://pypi.org/simple
或
pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
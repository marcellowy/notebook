### Git设置全局 Name/Email
```shell
git config --global user.name "Your Name"   # 设置全局的用户名称
git config --global user.email "your_email@example.com"   # 设置全局的邮箱地址
```

### Git为单独仓库设置 Name/Email
进入仓库根目录，然后执行以下命令：
```shell
git config user.name "Your Name"   # 设置全局的用户名称
git config user.email "your_email@example.com"   # 设置全局的邮箱地址
```

### 拉子仓库内容
```shell
# clone同时拉子模块
git clone --recursive

# 首次拉取子模块
git submodule update --init --recursive

# 更新子模块
git submodule update --recursive
```
+++
date = '2025-07-12T12:47:16+08:00'
title = 'git设置'
+++

### git 使用指定 ssh key
```shell
# 在仓库 clone 时指定key
git clone git@github.com:yoyun/hello.git --config core.sshCommand="ssh -i ~/.ssh/you_ssh_key"

# 在 config 中指定
git config core.sshCommand "ssh -i ~/.ssh/you_ssh_key"
```
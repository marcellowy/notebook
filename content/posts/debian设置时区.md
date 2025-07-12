+++
date = '2025-07-12T11:10:16+08:00'
title = 'Debian 设置时区'
+++

```shell
# 设置时区
sudo timedatectl set-timezone Asia/Shanghai
# 查看
sudo timedatectl status
# 查看
date
```

```shell
# 手动设置
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

```
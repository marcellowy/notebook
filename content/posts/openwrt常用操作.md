+++
date = '2025-07-12T11:10:16+08:00'
title = 'openwrt常用操作'
+++

### 修改网卡
```shell
vim /etc/config/network # 把ip修改为你局域网的IP
service restart network # 修改完重启网卡
```
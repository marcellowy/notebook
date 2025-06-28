## iptables
最近发现docker不受iptables管理,ufw的管理虽然简单，但是总感觉不好控制
还是习惯用iptables,就切换回来好了

## iptables安装
```shell
# 安装
apt install iptables iptables-persistent

# 保存当前,相当于持久化
netfilter-persistent save

# 查看当前配置
iptables-save
```

### iptables配置
```shell
# 显示当前iptables配置
iptables -vnL --line-numbers

iptables -F # 清除默认
iptables -X # 清除所有自定义链

iptables -P INPUT DROP # 设置INPUT链默认drop

# RELATED 服务器主动发起的请求
# ESTABLISHED 已经建立连接的请求
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# 本地回环
iptables -A INPUT -i lo -j ACCEPT

# 放行icmp
iptables -A INPUT -p icmp -j ACCEPT

# 放行web端口,多端口放行
# New 新的连接
iptables -A INPUT -p tcp -m multiport -m state --state NEW --dport 80,443 -j ACCEPT

# 放行连续端口
iptables -A INPUT -p tcp -m state --state NEW --dport 5100:5120 -j ACCEPT

# 常规单端口放行
iptables -A INPUT -p tcp -m state --state NEW --dport 58604 -j ACCEPT

```

### 常用配置
```shell
-i eth0 指定网卡
-s 指定来源ip
-d 指定目标ip
--sport 指定来源端口
--dport 指定目标端口
-j ACCEPT 放行
-j REJECT 拒绝
```
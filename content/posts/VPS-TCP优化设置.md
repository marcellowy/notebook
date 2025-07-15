AI给的,是为1Gbps的带宽准备的,实测没啥效果
```shell
# 接收缓存
net.core.rmem_max = 212992        # 64MB
net.core.rmem_default = 212992      # 默认 256KB

# 发送缓存
net.core.wmem_max = 212992        # 64MB
net.core.wmem_default = 212992      # 默认 256KB

# 网络连接追踪
net.netfilter.nf_conntrack_max = 65536

# TCP 内部缓冲设置
net.ipv4.tcp_rmem = 4096 131072 6291456   # 最小/默认/最大
net.ipv4.tcp_wmem = 4096 16384 4194304
```
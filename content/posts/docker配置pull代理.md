+++
date = '2025-07-12T11:10:16+08:00'
title = 'docker配置pull代理'
+++

1.创建 dockerd 相关的 systemd 目录，这个目录下的配置将覆盖 dockerd 的默认配置
```shell
sudo mkdir -p /etc/systemd/system/docker.service.d
```

2.新建配置文件 /etc/systemd/system/docker.service.d/http-proxy.conf，这个文件中将包含环境变量
```shell
[Service]
Environment="HTTP_PROXY=http://proxy.example.com:80"
Environment="HTTPS_PROXY=https://proxy.example.com:443"
```

3.如果你自己建了私有的镜像仓库，需要 dockerd 绕过代理服务器直连，那么配置 NO_PROXY 变量：
```shell
[Service]
Environment="HTTP_PROXY=http://proxy.example.com:80"
Environment="HTTPS_PROXY=https://proxy.example.com:443"
Environment="NO_PROXY=your-registry.com,10.10.10.10,*.example.com"
```

4.重新加载配置文件，重启 dockerd
```shell
systemctl daemon-reload
systemctl restart docker
```

5.检查确认环境变量已经正确配置：
```shell
systemctl show --property=Environment docker
```
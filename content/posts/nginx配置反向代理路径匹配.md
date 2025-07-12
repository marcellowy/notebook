+++
date = '2025-07-12T11:10:16+08:00'
title = 'nginx配置反向代理路径匹配'
+++

访问路径固定为：http://x.x.x.x/user/index.html
```shell
location /user/ {
    proxy_pass http://127.0.0.1:8080/ => http://127.0.0.1:8080/index.html
}

location /user/ {
    proxy_pass http://127.0.0.1:8080 => http://127.0.0.1:8080/user/index.html
}

location /user/ {
    proxy_pass http://127.0.0.1:8080/admin/ => http://127.0.0.1:8080/admin/index.html
}

location /user/ {
    proxy_pass http://127.0.0.1:8080/admin => http://127.0.0.1:8080/adminindex.html
}

```

location模块的匹配模式
```shell
进行uri的全路径精确匹配，要匹配的一模一样的uri
比如 location = /index ，那么只有路径为/index的才会匹配到
```

前缀模糊匹配 ^~
```shell
进行uri的前缀精确匹配
比如 location ^~ /user/ ，那么只要是路径以/user/开头的都会匹配到
```

无匹配符号的精确匹配
```shell
没有符号，按照路径开头精确匹配，但是匹配到后不会立即返回，
还会继续匹配其他普通匹配，如果匹配到，则会舍弃之前匹配的路径

比如 location /user/ , 当访问/user/开头时会匹配到
比如 location /user/admin，当访问/user/admin时会匹配到
```

模糊匹配 ~
```shell
进行uri的模糊匹配，区分大小写，匹配到后不再进行其他匹配
比如 location ~ /user/ ，当路径包含/user/时会匹配，比如/admin/user/或者/user/admin/
当然也可以用正则表达式来表示匹配路径：
比如 location ~ ^/user(.*)admin$，能够匹配以/user开头，admin结尾的路径，.*表示的是任意字符
```

模糊匹配 ~*
```shell
进行uri的模糊匹配，不区分大小写，匹配到后不再进行其他匹配，优先级与～相同，按照先后顺序优先
比如 location ~ /USER/，当路径包含/USER/时会匹配，如果是/user/则不会，因为区分大小写了
```
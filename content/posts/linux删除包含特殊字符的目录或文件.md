+++
date = '2025-07-12T11:10:16+08:00'
title = 'linux删除包含特殊字符的目录或文件'
+++

首先使用 ls -i 查看包含特殊字符的文件/目录名
```shell
root@comet:~# ls -i -l
total 28
26222802 drwxr-xr-x 2 root root 4096 Feb  6  2024  fonts
26214522 drwxr-xr-x 2 root root 4096 Jun 27 10:12  nes
26214418 drwxr-xr-x 2 root root 4096 May 16 15:18  picoshare
26214527 -rw-r--r-- 1 root root 7033 Nov 13 01:14 ''$'\033'':Qq' # 这就是我需要删除的
26214412 drwxr-xr-x 3 root root 4096 Jun 28 04:06  sslocal
26214504 drwxrwxrwx 5 root root 4096 May 22 01:30  transmission
```
然后通过find后进行删除
```shell
root@comet:~# find . -inum 26214527 -exec rm -r {} \; # 后面的 ; 不能省略
root@comet:~# ls -l
total 20
drwxr-xr-x 2 root root 4096 Feb  6  2024 fonts
drwxr-xr-x 2 root root 4096 Jun 27 10:12 nes
drwxr-xr-x 2 root root 4096 May 16 15:18 picoshare
drwxr-xr-x 3 root root 4096 Jun 28 04:06 sslocal
drwxrwxrwx 5 root root 4096 May 22 01:30 transmission
```
### 硬盘格式化
```shell
root@comet:~# mkfs.ext4 /dev/sda
一路回车就好
```

### 硬盘分区
```shell
# 超过一定大小的硬盘要用disk分区和格式化，操作和 fdisk 是一样的
apt install gdisk
gdisk /dev/sda
# 一路回车就好
# 最后再格式化一下分区
mkfs.ext4 /dev/sda1
```

### 硬盘挂载
```shell
mount /dev/sda1
# 永久挂载
vim /etc/fstab
# 写入如下信息
# UUID可以通过 lsblk -f 查看
# xfs 挂载的分区类型，lsblk -f 里 FSTYPE 列会显示
# defaults 默认选项, 其余值自行搜索
# 第一个0:表示备份频率
# 第二个0:表示开机时检查文件系统的顺序，0：表示不检查
UUID=c2493762-e206-4f4d-9400-42456831ec62 /data/test1            xfs    defaults        0 0
# 这里可以自行搜索一下，写法有好几种
```
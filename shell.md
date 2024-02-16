### 遍历数组
```shell
repo=("nc-mini-api" "nc-mini-go" "nc-mini-mp" "nc-mini-shop" "nc-mini-upload" "wechat-access-token")
for item in ${!repo[@]};
do
  echo "索引: ${item} 值: ${repo[$item]}"
done
```
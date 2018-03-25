# zeronet-autoseed

zeronet 自动给新站做源工具，基于官方镜像。

docker run -d -v <local_data_folder>:/root/data -p 15441:15441 chenjia404/zeronet-autoseed

如果需要开启tor

docker run -d -e "ENABLE_TOR=true" -v <local_data_folder>:/root/data -p 15441:15441 chenjia404/zeronet-autoseed

注意这个是给新站做源，所以不需要访问，不然会有Invalid host错误。



# 原理
每分钟自动打开http://127.0.0.1:43110/1LtvsjbtQ2tY7SCtCZzC4KhErqEK3bXD4n/ 里面最新的5个站点。

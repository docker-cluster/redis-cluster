# redis-cluster

## 说明

端口映射: 36379-36384:36379-36384, 46379-46384:46379-46384

规格：三主三从

网络：host

## 部署

``` bash
git clone https://github.com/docker-cluster/redis-cluster.git
cd redis-cluster
chmod +x setup.sh
./setup.sh
```

## 测试

``` bash
local_host="`hostname --fqdn`"
local_ip=`host $local_host 2>/dev/null | awk '{print $NF}'`
docker exec -it redis-master1 redis-cli -c -h $local_ip -p 36379 set test hello
docker exec -it redis-master1 redis-cli -c -h $local_ip -p 36384 get test
```




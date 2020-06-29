#!/bin/bash

echo "***************************start to init redis-cluster containers***************************"
docker-compose down
rm -rf redis-*
mkdir {redis-master{1..3},redis-slave{1..3}}
for F in {redis-master{1..3},redis-slave{1..3}} ;do cp -fv redis.conf $F ;done
mytest=36379 ;for F in {redis-master{1..3},redis-slave{1..3}} ;do sed -i "s/6379/$mytest/" $F/redis.conf ;mytest=$(expr $mytest + 1) ;done
docker-compose up -d
echo "***************************redis-cluster containers inited***************************"

echo "***************************start to connect redis-cluster***************************"
local_host="`hostname --fqdn`"
local_ip=`host $local_host 2>/dev/null | awk '{print $NF}'`
echo yes |docker run --rm -i inem0o/redis-trib create --replicas 1 $local_ip:363{79..84}
echo "***************************redis-cluster connected***************************"

echo "success"

exit 0
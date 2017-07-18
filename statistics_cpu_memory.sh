#!/bin/sh
while [ 1 -gt 0 ]
do
    ps -e -o pcpu,rss,comm |grep redis-server|awk 'BEGIN { cpu=0;mem=0}{cpu=cpu+$1;mem=mem+$2;} END {print cpu,mem}'>>redis-server
    ps -e -o pcpu,rss,comm |grep gnocchi-metricd|awk 'BEGIN { cpu=0;mem=0}{cpu=cpu+$1;mem=mem+$2;} END {print cpu,mem}' >>gnocchi-metricd
    sleep 1
done

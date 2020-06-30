#!/bin/sh

docker run  -td -p 8282:8080 --name kiftd82 \
            -v /root/data:/data \
            -v /root/data:/kiftd/filesystem/ \
            taeylm/kiftd-debian:0.1.2

sed -i 's/\(deb\|security\).debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
apt update && apt install -y git && \
git clone https://gitee.com/kohgylw/kiftd.git /kiftd && \

export LANG=C.UTF-8
export PATH=/usr/share/jre1.8.0_251/bin:$PATH

java -jar /kiftd/kiftd-1.0.34-RELEASE.jar -start

# 构建镜像
# docker build -t taeylm/kiftd-debian:0.1.2 /root/kiftd

            --restart always \
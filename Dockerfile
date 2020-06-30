FROM debian:latest
COPY ./jre-8u251-linux-x64.tar.gz /root/
ENV PATH=/usr/share/jre1.8.0_251/bin:$PATH
ENV LANG=C.UTF-8
RUN sed -i 's/\(deb\|security\).debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt update && apt install -y git && \
    git clone https://gitee.com/kohgylw/kiftd.git /kiftd && \
    tar -zxvf /root/jre-8u251-linux-x64.tar.gz -C /usr/share/ && \
    echo "java -jar /kiftd/kiftd-1.0.34-RELEASE.jar -start" > start.sh && \
    chmod +x start.sh
EXPOSE 8080
# VOLUME [ "/root/data", "/kiftd/filesystem" ]
# VOLUME ["/kiftd/conf","/data"]
# ENTRYPOINT [ "java", "-jar", "/kiftd/kiftd-*-RELEASE.jar", "-start" ]
CMD [ "sh", "start.sh" ]

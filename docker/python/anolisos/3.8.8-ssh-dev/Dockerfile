FROM python:3.8.8

COPY \
    [ "docker-entrypoint.sh", "/usr/local/bin" ]

RUN set -eux; \
    yum install -y openssh-server \
                   gcc \
                   gcc-c++ \
                   make \
                   cmake \
                   git \
                   gdb; \
                   ssh-keygen -A; \
                   yum clean all; \ 
                   chmod +x /usr/local/bin/*; \
                   mkdir /var/run/sshd /workspace

FROM scratch

COPY --from=0 / /

# 区时设置
ENV TZ="Asia/Shanghai" \
    LANG="zh_CN.UTF-8" \
    LC_ALL="C"

ENV SSH_USERNAME="cxwn" \
    SSH_PASSWD="C*x#1a2b" \
    SSH_UID="1000" \
    SSH_GROUP="cxwn" \
    SSH_GID="1000"

WORKDIR /workspace

ENTRYPOINT [ "docker-entrypoint.sh" ]

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D" ]

FROM openeuler/openeuler:20.03-lts-sp3

COPY [ "docker-entrypoint.sh", "/usr/local/bin" ]
ADD ["go1.24.2.linux-amd64.tar.gz", "/usr/local/"]

RUN set -eu; \
    yum -y install openssh-server \
    rsync \
    make \
    gdb; \
    bc; \
    ssh-keygen -A; \
    yum clean all; \ 
    chmod +x /usr/local/bin/*; \
    mkdir -p /var/run/sshd /root/workspace /workspace/.go

FROM scratch

COPY --from=0 / /

# 区时设置
ENV TZ="Asia/Shanghai" \
    LANG="zh_CN.UTF-8"

# SSH默认设置，用户名、组默认均为cxwn，密码为：C*x#1a2b，GID为1000
ENV SSH_USERNAME="cxwn" \
    SSH_PASSWD="C*x#1a2b" \
    SSH_UID="1000" \
    SSH_GROUP="cxwn" \
    SSH_GID="1000"

# GO语言相关环境变量设置
ENV GOPATH="/workspace/.go" \
    GOROOT="/usr/local/go" \
    GOPROXY="https://goproxy.cn,direct" \
    GO111MODULE="auto"

ENV GOBIN="${GOPATH}/bin"

# 设置系统环境变量
ENV PATH="$GOROOT/bin:$GOBIN:$PATH"

WORKDIR /workspace

ENTRYPOINT [ "docker-entrypoint.sh" ]

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D" ]

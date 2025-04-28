#!/bin/bash
go version
gdb -v
make -v
groupadd -g ${SSH_GID} ${SSH_GROUP}
useradd -d /home/${SSH_USERNAME} -m -c "Golang development environment." -u ${SSH_UID} -g ${SSH_GID} -s /bin/bash ${SSH_USERNAME}
echo "${SSH_USERNAME}:${SSH_PASSWD}" | chpasswd
[ ! -d /workspace/.go ] && mkdir -p /workspace/.go
mkdir "${GOPATH}/src" "${GOPATH}/bin" "${GOPATH}/pkg"
chown -R ${SSH_USERNAME}:${SSH_GROUP} /workspace

cat>/home/${SSH_USERNAME}/.bashrc<<-EOF
# GO语言相关环境变量设置
export GOPATH="/workspace/.go"
export GOROOT="/usr/local/go"
export GOPROXY="https://goproxy.cn,direct"
export GO111MODULE="auto"
export GOBIN="\${GOPATH}/bin"
export PATH="\${PATH}:\${GOROOT}/bin:\${GOPATH}/bin"
EOF

exec "$@"

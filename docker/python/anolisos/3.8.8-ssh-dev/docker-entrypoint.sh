#!/bin/bash

groupadd -g ${SSH_GID} ${SSH_GROUP}
useradd -d /home/${SSH_USERNAME} -m -c "Python3 development environment." -u ${SSH_UID} -g ${SSH_GID} -s /bin/bash ${SSH_USERNAME}
echo "${SSH_USERNAME}:${SSH_PASSWD}" | chpasswd
[ ! -d /workspace ] && mkdir /workspace
chown -R ${SSH_USERNAME}:${SSH_GROUP} /workspace

cat>/home/${SSH_USERNAME}/.bashrc<<-EOF
export TMOUT=30000
cd /workspace
EOF

exec "$@"

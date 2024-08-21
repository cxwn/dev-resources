docker run -d --restart always \
    --hostname develop -e SSH_UID=`id -u` \
    -e SSH_GID=`id -g` -e SSH_USERNAME=`whoami` \
    -e SSH_PASSWD="C*x#1a2b" -e SSH_GROUP=`id -g -n` \
    --name python-dev-host \
    -v ${HOME}/workspace/python:/workspace \
    -p 10110:22 python:3.8.8

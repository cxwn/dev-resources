ARG TARGETARCH

FROM \
    openeuler:22.03-lts-sp4-$TARGETARCH

# python3 -m pip install --upgrade pip
RUN set -exu; \
    dnf -y install iproute iputils python3-pip tcpdump; \
    pip install 'httpx[cli]'; \
    pip cache purge; \
    yum clean all; \
    rm -rf /var/cache/yum/*; \
    rm -rf /root/.cache; \
    rm -rf /tmp/*

FROM scratch

COPY \
    --from=0 / /

LABEL \
    AUTHOR="IVAN DU" \
    DATE="2024-09-06"

ENV TZ="Asia/Shanghai" \
    LANG="zh_CN.UTF-8" \
    LC_ALL="C"

CMD [ "/bin/bash" ]

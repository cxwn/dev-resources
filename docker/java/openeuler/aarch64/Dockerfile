FROM \
    openeuler:22.03-lts-sp4-aarch64

# https://adoptium.net
# https://objects.githubusercontent.com/github-production-release-asset-2e65be/372925194/74423924-4882-4ef3-8e24-af21b52bcba5?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241203%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241203T034352Z&X-Amz-Expires=300&X-Amz-Signature=ed9eb45cc48f4f9dfdbad541f5fea2e0a7ba4b702fb472da5029801d37700020&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3DOpenJDK17U-jre_x64_linux_hotspot_17.0.13_11.tar.gz&response-content-type=application%2Foctet-stream
ARG JDK_PACKAGE="OpenJDK17U-jre_aarch64_linux_hotspot_17.0.13_11.tar.gz"

ADD [ "${JDK_PACKAGE}", "/opt/"]

ENV JAVA_HOME="/opt/jre-17"

ENV PATH="${JAVA_HOME}/bin:${PATH}"

RUN set -eux; \
    cd /opt; \
    mv jdk-17* jre-17; \
    dnf -y install glibc-langpack-zh; \
    rm -rf /var/cache/yum/*; \
    dnf clean all; \
    java -version

FROM \
    scratch

COPY \
    --from=0 / /

ENV LC_ALL="C" \
    TZ="Asia/Shanghai" \
    LANG="zh_CN.UTF-8"

ENV JAVA_HOME="/opt/jre-17"

ENV PATH="${JAVA_HOME}/bin:${PATH}"

CMD ["/bin/bash"]

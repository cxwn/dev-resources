FROM \
    openanolis/anolisos:8.6

LABEL \
    AUTHOR="cxwn"
# https://adoptium.net/zh-CN/temurin/releases/?os=linux&arch=x64&package=jre&version=17
# https://objects.githubusercontent.com/github-production-release-asset-2e65be/372925194/6976e065-b4f0-49f2-8837-8131cd5f922a?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240222%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240222T103255Z&X-Amz-Expires=300&X-Amz-Signature=fe62971f878b2158e282688242789c62c5c8012fad0f0ce3d4333c748d094738&X-Amz-SignedHeaders=host&actor_id=9364147&key_id=0&repo_id=372925194&response-content-disposition=attachment%3B%20filename%3DOpenJDK17U-jre_x64_linux_hotspot_17.0.10_7.tar.gz&response-content-type=application%2Foctet-stream
ADD ["OpenJDK17U-jre_x64_linux_hotspot_17.0.8.1_1.tar.gz", "/opt/"]

ENV JAVA_HOME="/opt/jdk-17.0.8.1+1-jre"

ENV PATH="${JAVA_HOME}/bin:${PATH}"

ENV TZ="Asia/Shanghai" \
    LANG="zh_CN.UTF-8"

RUN set -eux; \
    dnf -y install glibc-langpack-zh; \
    rm -rf /var/cache/yum/*; \
    dnf clean all; \
    java -version

CMD [ "/bin/bash" ]
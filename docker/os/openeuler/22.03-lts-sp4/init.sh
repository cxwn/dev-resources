#!/bin/bash

set -eux
architectures=("x86_64" "aarch64")
echo "Please select the architecture:"
select arch in "${architectures[@]}"; do
    case $arch in
        "x86_64")
            echo "You selected x86_64 architecture."
            ARCH=$arch
            break
            ;;
        "aarch64")
            echo "You selected aarch64 architecture."
            ARCH=$arch
            break
            ;;
        *) 
            echo "You selected an invalid, please select again." 
            exit 1
            ;;
    esac
done

if [ -n "$ARCH" ]; then
    cd "$ARCH"
    [ -d build ] && rm -rf build && mkdir build
    [ ! -d build ] && mkdir build
    sha256sum -c openEuler-docker."$ARCH".tar.xz.sha256sum
    # shellcheck disable=SC2181
    if [ $? -ne 0 ]; then
        echo "Checksum failed."
        exit 2
    fi
    tar -xf openEuler-docker."$ARCH".tar.xz --wildcards "*.tar" --exclude "layer.tar"
    # shellcheck disable=SC2011 disable=SC2062 disable=SC2063
    ROOT_FS=$(ls | xargs -n1 | grep -v openEuler |grep *.tar)
    mv "$ROOT_FS" build/openEuler-docker-rootfs."$ARCH".tar
    cd build/
    [ -e openEuler-docker-rootfs."$ARCH".tar.xz ] && rm -rf openEuler-docker-rootfs."$ARCH".tar.xz
    xz -z openEuler-docker-rootfs."$ARCH".tar
    docker build --build-arg TARGETARCH="$ARCH" -t openeuler:22.03-lts-sp4-"$ARCH" -f ../../Dockerfile .
    cd ..
    rm -rf build
else
    echo "Please specify the architecture."
fi
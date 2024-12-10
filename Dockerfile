# Adapted from
# https://embeddeduse.com/2019/02/11/using-docker-containers-for-yocto-builds/
# By Keith Kyzivat, for zeus release

From ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install locales zstd file qemu gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev xterm python3-subunit mesa-common-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install curl gperf bison g++-multilib vim git-lfs
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
RUN ln -s /yoctobuild/.repo/repo/repo /usr/bin/repo

# In Ubuntu, /bin/sh is a link to /bin/dash. The dash shell does not support the source command.
# However, we need the source command in the very last line of the Dockerfile.
# We replace dash with bash.
RUN rm /bin/sh && ln -s bash /bin/sh

# The Yocto build fails if the Linux system does not configure a UTF8-capable locale.
RUN /usr/sbin/locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV PROJECT yocto-zeus

ARG USER_NAME=yocto
ARG host_uid=1000
ARG host_gid=1000
ARG BUILD_DIR=.
ARG META_BOOT2QT_DIR=.
ARG MACHINE=imx8qmmek
RUN groupadd -g $host_gid $USER_NAME && useradd -g $host_uid -m -s /bin/bash -u $host_uid $USER_NAME

# Preload the bash history with some commands the user will need to run.
COPY <<EOF /tmp/.bash_history
$META_BOOT2QT_DIR/b2qt-init-build-env list-devices
$META_BOOT2QT_DIR/b2qt-init-build-env init --device $MACHINE
repo init -u git://code.qt.io/yocto/boot2qt-manifest -m v5.15.1.xml
repo sync
export MACHINE=$MACHINE
source ./setup-environment.sh
bitbake b2qt-embedded-qt5-image
bitbake meta-toolchain-b2qt-embedded-qt5-sdk
EOF
RUN chown $USER_NAME:$USER_NAME /tmp/.bash_history
USER $USER_NAME
RUN mv /tmp/.bash_history $HOME
RUN echo "cat /yoctobuild/README.md" >> $HOME/.bashrc

WORKDIR $BUILD_DIR

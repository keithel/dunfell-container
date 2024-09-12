# Adapted from
# https://embeddeduse.com/2019/02/11/using-docker-containers-for-yocto-builds/
# By Keith Kyzivat, for dunfell release

From ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install locales lz4 zstd file qemu gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev xterm python3-subunit mesa-common-dev

# In Ubuntu, /bin/sh is a link to /bin/dash. The dash shell does not support the source command.
# However, we need the source command in the very last line of the Dockerfile.
# We replace dash with bash.
RUN rm /bin/sh && ln -s bash /bin/sh

# The Yocto build fails if the Linux system does not configure a UTF8-capable locale.
RUN /usr/sbin/locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV USER_NAME yocto
ENV PROJECT yocto-dunfell

ARG host_uid=1000
ARG host_gid=1000
RUN groupadd -g $host_gid $USER_NAME && useradd -g $host_uid -m -s /bin/bash -u $host_uid $USER_NAME

USER $USER_NAME

# Create yocto input and output directories to store the build artifacts
ENV BUILD_INPUT_DIR /home/$USER_NAME/yocto/input
ENV BUILD_OUTPUT_DIR /home/$USER_NAME/yocto/output
RUN mkdir -p $BUILD_INPUT_DIR $BUILD_OUTPUT_DIR

WORKDIR $BUILD_INPUT_DIR
RUN git clone -b dunfell git://git.yoctoproject.org/poky.git
RUN git clone -b dunfell https://github.com/OE4T/meta-tegra.git

USER $USER_NAME

FROM crops/poky

USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y git-lfs vim
RUN rm /usr/bin/python && ln -s python3 /usr/bin/python
ADD --chmod=755 https://storage.googleapis.com/git-repo-downloads/repo /usr/bin
RUN cat <<EOF >> /etc/skel/.bashrc
if [ ! -e /home/pokyuser/.ssh -a -e /hostuser.ssh ]; then
    echo ".ssh not set up and found host .ssh, setting up."
    ln -s /hostuser.ssh /home/pokyuser/.ssh
fi
if [ ! -e /home/pokyuser/.bash_history ]; then
    cat <<EEOF >> /home/pokyuser/.bash_history
repo init -u git://code.qt.io/yocto/boot2qt-manifest -m v5.15.16-lts.xml
repo sync
export MACHINE=raspberrypi3-64
source ./setup-environment.sh
bitbake b2qt-embedded-qt5-image
bitbake meta-toolchain-b2qt-embedded-qt5-sdk
ls -lah tmp/deploy/images/$MACHINE/b2qt-embedded-qt5-image-${MACHINE}.wic.xz tmp/deploy/sdk/b2qt-x86_64-meta-toolchain-b2qt-embedded-qt5-sdk-${MACHINE}.sh
~/Qt/Tools/b2qt/b2qt-flashing-wizard tmp/deploy/images/${MACHINE}
EEOF
    chown pokyuser:pokyuser /home/pokyuser/.bash_history
fi
if [ ! -e /home/pokyuser/.gitconfig -a -e /hostuser.gitconfig ]; then
    install -o pokyuser -g pokyuser /hostuser.gitconfig /home/pokyuser/.gitconfig
fi
EOF

FROM crops/poky

USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y git-lfs
RUN cat <<EOF >> /etc/skel/.bashrc
if [ ! -e /home/pokyuser/.ssh -a -e /hostuser.ssh ]; then
    echo ".ssh not set up and found host .ssh, setting up."
    ln -s /hostuser.ssh /home/pokyuser/.ssh
fi
EOF
# This directory is where yocto builds will be stored.

When you enter the docker container:

 * First set your machine by exporting the MACHINE environment variable to one
   of the devices listed in `~/meta-boot2qt/b2qt-init-build-env list-devices`.
 * Next, run: `~/meta-boot2qt/b2qt-init-build-env init --device $MACHINE`
   You will be placed in this build directory if you have not changed to it yet.
 * Source the environment setup script: `source setup-environment.sh`
 * Finally bitbake your desired target. For a full qt5 image:
   `bitbake b2qt-embedded-qt5-image`
 * Additionally you might want to build the toolchain:
   `bitbake meta-toolchain-b2qt-embedded-qt5-sdk`
 * You will find that your bash history is pre-populated with some of these
   commands to make it convenient to use.

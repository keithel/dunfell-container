# crops/poky docker image for building Boot2Qt images

This is a docker image that builds off of the crops/poky image to provide an
environment for building Boot2Qt yocto images. Provided that you provide your
gerrit credentials that link to a commercial Qt account, you can build
commercial Qt versions of Boot2Qt images.

# How to use this project

## Setup

Make sure you have plenty of disk space, on the order of 150GB free space.

Create a directory where you want to keep the openembedded, poky, and yocto
layer repositories, and your yocto build directory. I put mine in
`$HOME/Build/yocto`, but you can put yours wherever you would like. I will call
this \<Yocto Base\> later in this readme.

## How to run:

If you just want to run this, and not customize it, you can just fetch the image
using:

`docker pull kyzik/crops-poky`
`docker run --rm -it -v $HOME/.ssh:/hostuser.ssh -v $HOME/.gitconfig:/hostuser.gitconfig -v \<Yocto Base\>:\<Yocto Base\> kkyziva/crops-poky:latest --workdir=\<Yocto Base\>`

Now you should be in the container at a path that matches the path on your host machine.

From here you can follow along with the instructions at [How to Create Boot to Qt Image](https://doc.qt.io/Boot2Qt-6.2/b2qt-how-to-create-b2qt-image.html).


## How to build the Dockerfile

Very simple - there are presently no special arguments you need to pass to build
this docker image. Everything needed is defined in the Dockerfile, with the
exception of the tagged name. So this is published under kkyzivat with the name
crops-poky, I will tag it `kkyzivat/crops-poky`. I would have rathered naming it
with `crops/poky` in the name, but this is not allowed by dockerhub, even with
my user context added.

Here are the commands to run, replacing your own username for mine (s/kkyzivat/yourname/):

`docker build -t kkyzivat/crops-poky:latest .`
`docker push kkyzivat/crops-poky:latest`

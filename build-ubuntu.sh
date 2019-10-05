#!/bin/bash

sudo apt-get -y --force-yes install \
  autoconf \
  automake \
  build-essential \
  cmake \
  curl \
  gawk \
  git \
  libexpat1-dev \
  libtheora-dev \
  libtool \
  libva-dev \
  libvdpau-dev \
  libvo-amrwbenc-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  libxext-dev \
  libxvidcore-dev \
  lsb-release \
  pkg-config \
  tar \
  tclsh \
  texi2html

# For 12.04
# libx265 requires cmake version >= 2.8.8
# 12.04 only have 2.8.7
ubuntu_version=`lsb_release -rs`
need_ppa=`echo $ubuntu_version'<=12.04' | bc -l`
if [ $need_ppa -eq 1 ]; then
    sudo add-apt-repository ppa:roblib/ppa
    sudo apt-get update
    sudo apt-get install cmake
fi

./build.sh "$@"


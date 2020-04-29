#! /bin/bash
### Add Napari
set -x \
   && apt update \
   && apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget libbz2-dev libxcb1 libqt5gui5\
   && pwd \
   && curl -O https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz \
   && tar -xf Python-3.7.3.tar.xz \
   && pwd \
   && cd Python-3.7.3 \
   && pwd \
   && ls -l ./configure \
   && ./configure \
   && make -j 4 \
   && make install \
   && python3 --version \
   && apt install -y python3-pip \
   && pip3 --version

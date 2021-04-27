#! /bin/bash
### Add Napari
set -x \
   && apt update \
   && apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget libbz2-dev libxcb1 libqt5gui5 \
   && apt install -y libdbus-1-3 libxkbcommon-x11-0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-xinerama0 libxcb-xfixes0 \
   && pwd \
   && curl -O https://www.python.org/ftp/python/3.8.9/Python-3.8.9.tar.xz \
   && tar -xf Python-3.8.9.tar.xz \
   && pwd \
   && cd Python-3.8.9 \
   && pwd \
   && ls -l ./configure \
   && ./configure \
   && make -j 4 \
   && make install \
   && python3 --version \
   && apt install -y python3-pip \
   && pip3 install --upgrade pip setuptools wheel \
   && pip3 --version \
   && cd /opt \
   && curl -O  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
   && chmod +x Miniconda3-latest-Linux-x86_64.sh \
   && ./Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3 \
   && /opt/miniconda3/bin/conda update -n base -c defaults conda

#! /bin/bash
### Add Napari
set -x \
   && apt install -y git \
   && cd /usr/local/renci \
   && git clone https://github.com/napari/napari.git \
   && cd napari \
   && pwd \
   && pip3 install -e .

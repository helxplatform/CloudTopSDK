#! /bin/bash
### Add gnu octave
set -x \
   && apt update \
   && sudo apt install -y octave \
   && sudo apt install -y octave-doc \
   && sudo apt install -y liboctave-dev

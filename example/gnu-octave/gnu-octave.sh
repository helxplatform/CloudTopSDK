#! /bin/bash
### Add gnu octave
set -x \
   && apt update \
   && sudo apt install -y octave \
   && sudo apt install -y octave-doc  octave-info octave-htmldoc \
   && sudo apt install -y liboctave-dev

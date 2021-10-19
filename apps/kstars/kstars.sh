#! /bin/bash

### DS9
set -x \
  && apt-get install -y saods9

### Sample FITS files
set -x \
   && wget https://chandra.si.edu/photo/2009/tycho/fits/tycho_950-1260eV.fits -O tycho_950-1260eV.fits \
   && wget https://chandra.si.edu/photo/2009/tycho/fits/tycho_1630-2260eV.fits -O tycho_1630-2260eV.fits \
   && wget https://chandra.si.edu/photo/2009/tycho/fits/tycho_4100-6100eV.fits -O tycho_4100-6100eV.fits

### KStars
set -x && \
  sudo apt-get install -y kstars-data kstars

set -x && \
  sudo strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5

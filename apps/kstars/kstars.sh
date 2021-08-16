#! /bin/bash

### buster upgrade (i.e. debian 10)
echo "deb http://deb.debian.org/debian buster main contrib" > /etc/apt/sources.list \
   && apt-get update -qq \
   && apt-get full-upgrade -qqy

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

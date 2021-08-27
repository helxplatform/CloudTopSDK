#! /bin/bash

### buster upgrade (i.e. debian 10)
echo "deb http://deb.debian.org/debian buster main contrib" > /etc/apt/sources.list \
   && apt-get update -qq \
   && apt-get full-upgrade -qqy

###
set -x \
  && apt-get update -qq

#! /bin/bash
### Add kstars
#set -x \
#   && apt update \
#   && sudo apt install -y kstars

# buster, bullseye 
echo "deb http://deb.debian.org/debian buster main contrib" > /etc/apt/sources.list && \
    apt-get update -qq && \
    apt-get full-upgrade -qqy

set -x && \
  sudo apt-get update

set -x && \
  sudo apt-get install -y software-properties-common && \
  sudo apt-add-repository ppa:mutlaqja/ppa && \
  sudo apt-get update && \
  sudo apt-get upgrade
set -x && \
  sudo apt-get install -y kstars-data kstars

#!/bin/bash
### lets install ImageJ
set -x \
  && cd /usr/local/renci/bin \
  && curl -SLo ij152-linux64-java8.zip http://wsr.imagej.net/distros/linux/ij152-linux64-java8.zip \
  && unzip ij152-linux64-java8.zip \
  && rm -f ij152-linux64-java8.zip \
  && alias imagej="/usr/local/openjdk-8/bin/java -Xmx512m -cp /usr/local/renci/bin/ImageJ/ij.jar ij.ImageJ"

#!/bin/bash
### lets install Verdi
set -x \
  && cd /usr/local/renci/bin \
  && curl -SLo VERDI_2.1_linux64_20210526.tar.gz https://github.com/lizadams/chrome-docker/releases/download/v_2.1/VERDI_2.1_linux64_20210526.tar.gz \
  && tar xvfz VERDI_2.1_linux64_20210526.tar.gz

#! /bin/bash
### Add the OHSDI software requirements
set -x \
   && apt update \
   && apt install -y postgresql postgresql-contrib \
   && apt install -y nodejs \
   && apt install -y nodejs 

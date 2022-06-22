#! /bin/bash

### SCOUT
cd /
git clone --branch master https://github.com/helxplatform/scout.git
cd ./scout
conda install -y python=3.7
pip install -r ./requirements.txt
pip install .

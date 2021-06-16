#! /bin/bash
### Add Napari
set -x \
   && /opt/miniconda3/bin/conda install -y -c conda-forge napari \
   && chmod -R 777 /opt/miniconda3

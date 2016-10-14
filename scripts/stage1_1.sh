#!/bin/bash

echo "Create Directories"
mkdir data
mkdir info
mkdir neg


echo "Download negatives"
export PYTHONPATH="/usr/lib/python2.7/dist-packages/" 
python download-image-by-link.py --stage 1_1

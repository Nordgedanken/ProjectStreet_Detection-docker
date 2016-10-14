#!/bin/bash

echo "Download negatives"
export PYTHONPATH="/usr/lib/python2.7/dist-packages/" 
python download-image-by-link.py --stage 1_2

zstd --train neg/* -o neg
zstd neg.zst -D neg
cp "./neg.zst" "/root/shared/results/neg.zst" && echo "neg.zst in upload"
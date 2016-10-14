#!/bin/bash

echo "Download negatives"
export PYTHONPATH="/usr/lib/python2.7/dist-packages/" 
python download-image-by-link.py --stage 1_2

zstd --train neg/* -o neg_dict
zstd neg.zst -D neg_dict
cp "./neg_dict" "/root/shared/results/neg_dict" && echo "neg_dict in upload"
cp "./neg.zst" "/root/shared/results/neg.zst" && echo "neg.zst in upload"

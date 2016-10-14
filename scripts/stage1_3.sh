#!/bin/bash

echo "Download negatives"
export PYTHONPATH="/usr/lib/python2.7/dist-packages/" 
python download-image-by-link.py --stage 1_3

zstd --train pos/* -o pos
zstd pos.zst -D pos
cp "./pos.zst" "/root/shared/results/pos.zst" && echo "pos.zst in upload"
cp "./bg.txt" "/root/shared/results/bg.txt" && echo "bg.txt in upload"

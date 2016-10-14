#!/bin/bash

echo "Download negatives"
export PYTHONPATH="/usr/lib/python2.7/dist-packages/" 
python download-image-by-link.py --stage 1_3

zstd --train pos/* -o pos_dict
zstd pos.zst -D pos_dict
cp "./pos_dict" "/root/shared/results/pos_dict" && echo "pos_dict in upload"
cp "./pos.zst" "/root/shared/results/pos.zst" && echo "pos.zst in upload"
cp "./bg.txt" "/root/shared/results/bg.txt" && echo "bg.txt in upload"
zstd --train neg/* -o neg_dict
zstd neg.zst -D neg_dict
cp "./neg_dict" "/root/shared/results/neg_dict" && echo "neg_dict in upload"
cp "./neg.zst" "/root/shared/results/neg.zst" && echo "pos.zst in upload"

#!/bin/bash

echo "Create Directories"
mkdir data
mkdir info
mkdir neg


echo "Download negatives"
export PYTHONPATH="/usr/lib/python2.7/dist-packages/" 
python download-image-by-link.py

echo "generate poitives"
NUM_FILES=$(ls -1 neg --file-type | grep -v '/$' | wc -l)-10
ls -la
opencv_createsamples -img ./sample_street.jpg -bg ./bg.txt -info ./info/info.lst -pngoutput info -maxxangle 0.5 -maxyangle 0.5 -maxzangle 0.5 -num $NUM_FILES
ls -la info

echo "generate vec files"
opencv_createsamples -info ./info/info.lst -num $NUM_FILES -w 50 -h 50 -vec positives.vec
ls -la neg
ls -la

zstd --train neg/* -o neg
zstd neg.zst -D neg
zstd --train data/* -o data
zstd data.zst -D data
cp "./neg.zst" "/root/shared/results/neg.zst" && echo "neg.zst in upload"
cp "./data.zst" "/root/shared/results/data.zst" && echo "data.zst in upload"
cp "./bg.txt" "/root/shared/results/bg.txt" && echo "bg.txt in upload"
cp "./positives.vec" "/root/shared/results/positives.vec" && echo "positives.vec in upload"

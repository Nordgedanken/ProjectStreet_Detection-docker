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

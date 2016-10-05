#!/bin/bash

mkdir data
mkdir info

python face_detect.py
opencv_createsamples -img sample_street.jpg -bg bg.txt -info info/info.lst -pngoutput info -maxxangle 0.5 -maxyangle 0.5 -maxzangle 0.5 -num 1442
opencv_createsamples -info info/info.lst -num 1442 -w 20 -h 20 -vec positives.vec

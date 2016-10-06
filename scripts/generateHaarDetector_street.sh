#!/bin/bash

mkdir data
mkdir info
mkdir neg


export PYTHONPATH="/usr/lib/python2.7/dist-packages/" 
python download-image-by-link.py
ls -la
opencv_createsamples -img ./sample_street.jpg -bg ./bg.txt -info ./info/info.lst -pngoutput info -maxxangle 0.5 -maxyangle 0.5 -maxzangle 0.5 -num 1442
ls -la info
opencv_createsamples -info ./info/info.lst -num 1400 -w 50 -h 50 -vec positives.vec
ls -la neg
ls -la
#cache optimisation
crontab -l > cron
#echo new cron into cron file
{
        echo "* * * * * echo 1 > /proc/sys/vm/drop_caches"
        echo "* * * * * echo 2 > /proc/sys/vm/drop_caches"
        echo "* * * * * echo 3 > /proc/sys/vm/drop_caches" 
} >> cron
#install new cron file
crontab cron
rm cron
opencv_traincascade -data ./data -vec ./positives.vec -bg ./bg.txt -numPos 1300 -numNeg 650 -numStages 20 -w 50 -h 50
cp "data/cascade.xml" "/root/shared/results/street-cascade-$(date +%s).xml"

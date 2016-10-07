FROM mtrnord/opencv:latest

MAINTAINER MTRNord <info@nordgedanken.de>

RUN apt-get install -y cron perf-tools-unstable 
CMD cron

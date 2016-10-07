FROM mtrnord/opencv:latest

MAINTAINER MTRNord <info@nordgedanken.de>

RUN apt-get install -y cron linux-tools-common linux-tools-generic linux-tools-`uname -r`

COPY scripts/ PStreet
WORKDIR PStreet
CMD cron

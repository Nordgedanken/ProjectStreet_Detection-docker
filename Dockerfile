FROM mtrnord/opencv:latest

MAINTAINER MTRNord <info@nordgedanken.de>

RUN apt-get install -y cron linux-tools linux-generic

COPY scripts/ PStreet
WORKDIR PStreet
CMD cron

FROM mtrnord/opencv:latest

MAINTAINER MTRNord <info@nordgedanken.de>

RUN apt-get install -y cron

COPY scripts/ PStreet
WORKDIR PStreet
CMD cron

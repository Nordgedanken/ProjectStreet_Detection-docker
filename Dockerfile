FROM mtrnord/opencv:latest

MAINTAINER MTRNord <info@nordgedanken.de>

RUN apt-get install -y cron && pip install urllib2

COPY scripts/ PStreet
WORKDIR PStreet
CMD cron

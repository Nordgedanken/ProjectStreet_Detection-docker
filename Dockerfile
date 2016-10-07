FROM mtrnord/opencv:latest

MAINTAINER MTRNord <info@nordgedanken.de>

RUN apt-get install -y cron linux-tools
CMD cron

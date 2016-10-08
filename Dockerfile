FROM mtrnord/opencv:latest

MAINTAINER MTRNord <info@nordgedanken.de>

RUN apt-get install -y cron git
RUN git clone https://github.com/facebook/zstd.git && cd zstd && make && make install
COPY scripts/ PStreet
WORKDIR PStreet
CMD cron

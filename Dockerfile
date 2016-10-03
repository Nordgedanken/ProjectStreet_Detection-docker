FROM mtrnord/opencv:latest

MAINTAINER MTRNord <info@nordgedanken.de>

RUN echo $PYTHONPATH
RUN ls -la /usr/local/lib/python2.7/site-packages
ENV PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
COPY scripts/ FaceDetect
WORKDIR FaceDetect

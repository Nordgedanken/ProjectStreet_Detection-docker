FROM mtrnord/opencv:latest

MAINTAINER MTRNord <info@nordgedanken.de>

COPY scripts/ FaceDetect
WORKDIR FaceDetect

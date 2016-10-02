FROM mtrnord/opencv:latest

MAINTAINER MTRNord <info@nordgedanken.de>

RUN git clone https://github.com/shantnu/FaceDetect.git
WORKDIR FaceDetect

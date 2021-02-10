FROM ubuntu:20.04
ENV USER root
RUN    apt-get update; \
        apt-get install -y wget curl bash; 

RUN apt-get install python3-pip python -y
RUN apt-get install python-is-python3 -y
RUN apt-mark hold python2 python2-minimal python2.7 python2.7-minimal libpython2-stdlib
RUN pip3 install pyserial

RUN set -eux; \
    curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh 

ADD arduino-cli.yaml /.arduino-cli.yaml
RUN arduino-cli core update-index
RUN arduino-cli core update-index --config-file .arduino-cli.yaml
RUN arduino-cli core install esp32:esp32 --config-file .arduino-cli.yaml
RUN arduino-cli core list
   
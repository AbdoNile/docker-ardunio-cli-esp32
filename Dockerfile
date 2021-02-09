FROM ubuntu:18.04
ENV USER root
RUN    apt-get update; \
        apt-get install -y wget curl bash; 

RUN set -eux; \
    curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh 

ADD arduino-cli.yaml /.arduino-cli.yaml
# install enviroment
RUN arduino-cli core update-index
RUN arduino-cli core update-index --config-file .arduino-cli.yaml
RUN arduino-cli core install esp32:esp32 --config-file .arduino-cli.yaml
RUN arduino-cli core list
   

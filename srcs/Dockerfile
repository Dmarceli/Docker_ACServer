FROM ubuntu:latest

RUN apt-get update && \
    apt-get -y install \
        nano \
        wget 

COPY ./conf/ .
COPY ./tools/ .
RUN chmod +777 conf.sh

ENTRYPOINT [ "bash", "conf.sh" ]

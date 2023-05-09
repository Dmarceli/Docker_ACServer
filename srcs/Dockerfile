FROM debian:buster

RUN apt-get update && \
    apt-get -y install \
        nano \
        wget \
        git

COPY ./conf/conf.sh .
RUN chmod +777 conf.sh

ENTRYPOINT [ "bash", "conf.sh" ]

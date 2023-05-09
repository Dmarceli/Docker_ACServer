FROM debian:buster

RUN apt-get update && \
    apt-get -y install \
        nano \
        lib32gcc1 \
        zlib1g:i386 

COPY ./conf/conf.sh .
RUN chmod +777 conf.sh

ENTRYPOINT [ "bash", "conf.sh" ]

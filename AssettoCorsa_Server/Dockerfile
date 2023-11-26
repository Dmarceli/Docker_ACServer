FROM debian:buster

RUN apt-get update && \
    apt-get -y install \
        nano \
        wget \
        unzip
 
EXPOSE 9600/tcp
EXPOSE 9600/udp
EXPOSE 8081/tcp

COPY AssettoCorsa_Server/conf/ .
COPY AssettoCorsa_Server/tools/ .

RUN chmod +777 conf.sh

ENTRYPOINT [ "bash", "conf.sh" ]




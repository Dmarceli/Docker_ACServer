FROM debian:buster

RUN apt-get update && \
    apt-get -y install \
        vim \
        wget \
        unzip

EXPOSE 4040/tcp

COPY ./Ngrok/conf/ .

#RUN chmod +777 conf.sh

ENTRYPOINT [ "tail", "-500f" ]


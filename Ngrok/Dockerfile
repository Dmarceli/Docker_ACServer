FROM ngrok/ngrok:latest

# Expose ngrok web interface port
EXPOSE 4040/tcp

COPY ./conf/ .
RUN chmod +777 conf.sh

CMD ["bash", "setup.sh"]

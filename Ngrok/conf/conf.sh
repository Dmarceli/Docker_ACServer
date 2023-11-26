mkdir ngrok && cd ngrok

wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz

tar –xvzf ngrok-v3-stable-linux-amd64.tgz && rm ngrok-v3-stable-linux-amd64.tgz 

./ngrok config add-authtoken ${NGROK_AUTH}

./ngrok tcp assetto-corsa-server:9600

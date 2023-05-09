#!/bin/bash

apt-get install -y lib32gcc1 
apt-get install -y dotnet-sdk-7.0 

git clone https://github.com/compujuckel/AssettoServer.git && git checkout v0.0.51

tail -500f /dev/null
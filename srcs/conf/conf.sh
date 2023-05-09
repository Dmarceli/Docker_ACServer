#!/bin/bash

mkdir  ~/steam

cd ~/steam

wget http://media.steampowered.com/client/steamcmd_linux.tar.gz

tar -xvf steamcmd_linux.tar.gz
rm steamcmd_linux.tar.gz

./steamcmd.sh +@sSteamCmdForcePlatformType windows

tail -500f /dev/null
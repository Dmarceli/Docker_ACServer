#!/bin/bash

echo 'Cleaning temp folder...'
cd AssettoCorsa_Server
rm -rf tools/server/content/
mkdir server_files/temp
echo 'unzipping server files into temp'
unzip server_files/$1 -d server_files/temp/
echo 'Copying entry list to cfg...'
cp  server_files/temp/cfg/entry_list.ini tools/server/cfg/
echo 'Copying server details to cfg...'
cp  server_files/temp/cfg/server_cfg.ini tools/server/cfg/
echo 'Copying csp_params to cfg...'
cp  server_files/temp/cfg/csp_extra_options.ini tools/server/cfg/
echo 'Copying mods to server'
cp -rf server_files/temp/content tools/server/
echo 'Copying AC_server.exe to server'
cp server_files/temp/acServer.exe tools/server
rm -rf  server_files/temp
sed -i 's/EnableAi: true/EnableAi: false/' tools/server/cfg/extra_cfg.yml

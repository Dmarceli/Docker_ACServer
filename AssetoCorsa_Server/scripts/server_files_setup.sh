#!/bin/bash

echo 'Cleaning temp folder...'
rm -rf srcs/tools/server/content/
mkdir srcs/server_files/temp
echo 'unzipping server files into temp'
unzip srcs/server_files/$1 -d srcs/server_files/temp/
echo 'Copying entry list to cfg...'
cp  srcs/server_files/temp/cfg/entry_list.ini srcs/tools/server/cfg/
echo 'Copying server details to cfg...'
cp  srcs/server_files/temp/cfg/server_cfg.ini srcs/tools/server/cfg/
echo 'Copying csp_params to cfg...'
cp  srcs/server_files/temp/cfg/csp_extra_options.ini srcs/tools/server/cfg/
echo 'Copying mods to server'
cp -rf srcs/server_files/temp/content srcs/tools/server/
echo 'Copying AC_server.exe to server'
cp srcs/server_files/temp/acServer.exe srcs/tools/server
rm -rf  srcs/server_files/temp
sed -i 's/EnableAi: true/EnableAi: false/' srcs/tools/server/cfg/extra_cfg.yml

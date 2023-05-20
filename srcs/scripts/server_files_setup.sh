#!/bin/bash
while getopts zip: flag
do
    case "${flag}" in
        zip) server_file_names=${OPTARG};;
    esac
done

echo 'Cleaning temp folder...'
rm  ../server_files/*
echo 'unzipping server files into temp'
unzip $server_file_names ../server_files/temp/
echo 'Copying entry list to cfg...'
cp -r ../server_files/temp/cfg/entry_list.ini ../tools/server/cfg/
echo 'Copying server details to cfg...'
cp -r ../server_files/temp/cfg/server_cfg.ini ../tools/server/cfg/
echo 'Copying mods to server'
cp -rf ../server_files/temp/content/* ../tools/server/content/

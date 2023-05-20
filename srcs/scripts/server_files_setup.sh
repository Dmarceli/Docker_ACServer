#!/bin/bash
while getopts zip: flag
do
    case "${flag}" in
        zip) server_file_name=${OPTARG};;
    esac
done

echo 'Cleaning temp folder...'
rm  ../server_files/temp/*
echo 'unzipping server files into temp'
unzip $server_file_name ../server_files/temp/
echo 'Copying entry list to cfg...'
cp  ../server_files/temp/cfg/entry_list.ini ../tools/server/cfg/
echo 'Copying server details to cfg...'
cp  ../server_files/temp/cfg/server_cfg.ini ../tools/server/cfg/
echo 'Copying csp_params to cfg...'
cp  ../server_files/temp/cfg/csp_extra_options.ini ../tools/server/cfg/
echo 'Copying mods to server'
cp -rf ../server_files/temp/content/* ../tools/server/content/

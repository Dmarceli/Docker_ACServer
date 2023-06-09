#!/bin/bash

input_file="srcs/tools/server/cfg/entry_list.ini"
tmp_file="temp.txt"
extra_cfg_file="srcs/tools/server/cfg/extra_cfg.yml"

while IFS= read -r line; do
  if [[ $line == \[CAR_* ]]; then
    current_car=${line//[!0-9]/}
    ai_set=false
  elif [[ $line == MODEL=* ]]; then
    model=${line#*=}
    ai="AI=auto"

    if [[ $model == *traffic* ]]; then
      ai="AI=fixed"
    fi

    lines=()
    lines+=("[CAR_$current_car]")
    lines+=("MODEL=$model")
    ai_set=false
  elif [[ $line == RESTRICTOR=* ]]; then
    lines+=("$line")
    if [[ $ai_set == false ]]; then
      lines+=("$ai")
      ai_set=true
    fi
  else
    lines+=("$line")
  fi

  if [[ -n $lines ]]; then
    for content in "${lines[@]}"; do
      echo "$content" >> "$tmp_file"
    done
    lines=() 
  fi
done < "$input_file"
mv "$tmp_file" "$input_file"
sed -i 's/EnableAi: false/EnableAi: true/' "$extra_cfg_file"

source_folder="srcs/server_files/ai" 
target_directory="srcs/tools/server/content/tracks/csp/"  

first_subdir="$(find "$target_directory" -mindepth 1 -maxdepth 1 -type d | head -n 1)"

if [ -n "$first_subdir" ]; then
  cp -r "$source_folder" "$first_subdir"
fi
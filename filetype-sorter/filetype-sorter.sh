#!/bin/sh
folder_path=~/Downloads

for file in $folder_path/*;do
  ext=`echo $file | grep -oE "\.[^./]+$"`
  ext=${ext:1}
  ext_folder=$folder_path/$ext
  #filename="\"$(echo $file | grep -oE "[^/]+$")\""
  filename="$(echo $file | grep -oE "[^/]+$")"
  
  if [ -n "$ext" ]; then
    if [ ! -d $ext_folder ]; then
      mkdir -p "$ext_folder"
      echo "MKDIR $ext_folder"
    fi

    if [ ! "$file" = "$ext_folder" ]; then
      echo "$ext_folder     || $filename"
      mv "$file" "$ext_folder/$filename"
    fi
  fi

done

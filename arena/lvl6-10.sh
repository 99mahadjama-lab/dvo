#!/bin/bash

Folder_size_check() {

echo "Input directory path"
read folder
if [ -d $folder ]; then
continue
else
    echo "Folder doesn't exist"
    exit 1

list=( du -ah $folder | sed '$d' | sort -n )

echo "List of folders in order of size from smallest to biggest is:"
echo "$list"

}


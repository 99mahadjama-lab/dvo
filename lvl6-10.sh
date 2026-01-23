#!/bin/bash

Folder_size_check() {
local folder
echo "Input directory path"
read folder
if [ ! -d $folder ]; then
    echo "Folder doesn't exist"
    exit 1
fi
list=$(du -ah $folder | grep '\.txt$' | sort -n)

echo "List of folders in order of size from smallest to biggest is:"
echo "$list"
}
Folder_size_check

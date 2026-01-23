#!/bin/bash

calculate_sha256sum() {
    local file_path="$1"
    sha256sum "$file_path"

}

compare_checksums() {
    
    local file1="$1"
    local file2="$2"

    checksum1=$(sha256sum "$file1")
    checksum2=$(sha256sum "$file2")

        echo "File1: $file1"
        echo "File2: $file2"

    if [[ $checksum1 == $checksum2 ]]; then
        echo "Checksum's match, file is intact"
    else
        echo "Checksum's don't match, file integrity is compromised"
    fi


    echo "do you want to compare the checksum values yourself? y/n"
    read answer
    if [ $answer = "y" ]; then
        echo "File 1 Checksum Value: $checksum1"
        echo "File 2 Checksum Value: $checksum2"
    elif [ $answer = "n" ]; then
        echo "Goodbye"
        exit
    else
        echo "incorrect input, goodbye"
        exit
    fi

}

compare_checksums "read.txt" "read2.txt"
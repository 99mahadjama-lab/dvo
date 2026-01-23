#!/bin/bash

directory=$1

echo "What phrase do you wish to search?"
read phrase
find "$directory" -type f -name "*.log" | while IFS= read -r file; do
    if grep -q "$phrase" "$file"; then
        echo "$file"
    fi
done

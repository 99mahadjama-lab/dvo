#!/bin/bash

mkdir /Users/mahadjama/Documents/dvo/battlefield
mkdir /Users/mahadjama/Documents/dvo/archive
touch /Users/mahadjama/Documents/dvo/battlefield/knight.txt
touch /Users/mahadjama/Documents/dvo/battlefield/sorcerer.txt
touch /Users/mahadjama/Documents/dvo/battlefield/rouge.txt


if [ -f /Users/mahadjama/Documents/dvo/battlefield/knight.txt ]; then
    mv /Users/mahadjama/Documents/dvo/battlefield/knight.txt /Users/mahadjama/Documents/dvo/archive
fi

ls /Users/mahadjama/Documents/dvo/archive
ls /Users/mahadjama/Documents/dvo/battlefield
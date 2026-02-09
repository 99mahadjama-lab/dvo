#!/bin/bash

if [ -f /Users/mahadjama/Documents/dvo/backup ]; then
    cp /Users/mahadjama/Documents/dvo/arena/*.txt /Users/mahadjama/Documents/dvo/backup
else
    mkdir /Users/mahadjama/Documents/dvo/backup
    cp /Users/mahadjama/Documents/dvo/arena/*.txt /Users/mahadjama/Documents/dvo/backup
fi



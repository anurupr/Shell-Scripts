#!/bin/sh
DIR=`pwd`
find . -type d | while read line; do
    FOLDER=$( basename "$line" )
    FOLDER_PATH=$line
    echo "$FOLDER\t$DIR$FOLDER"
done

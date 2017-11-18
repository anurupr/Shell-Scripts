#!/bin/bash

search_dir='/media/anurup/GAMES1/Videos'

find "${search_dir}" -mindepth 1 -maxdepth 3 -type f  -print0 | xargs -0 -I {} echo "{}"
#for entry in "$search_dir"/*
#do
#  echo "$entry"
#done

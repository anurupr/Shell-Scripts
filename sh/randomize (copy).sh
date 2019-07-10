#!/bin/bash

cd Today
find . -type f |
shuf |  # shuffle the input lines, i.e. apply a random permutation
nl -n rz |  # add line numbers 000001, …
while read -r number name; do
  #echo mp3info -p "%a - %t" $name
  echo $number
  ext=${name##*/}  # try to retain the file name extension
  case $ext in
    *.*) ext=.${ext##*.};;
    *) ext=;;
  esac
  echo "../randomized/${name%/*}/$number$ext"
  echo "../randomized/$number$name"
  # mv "$name" "../randomized/${name%/*}/$number$ext"
done
cd ~

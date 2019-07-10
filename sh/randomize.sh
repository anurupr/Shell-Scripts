#!/bin/bash
cd /media/anurup/FC55-227D
for file in *; do
  nx=$RANDOM-"$file"
  mv "$file" "$nx"
done

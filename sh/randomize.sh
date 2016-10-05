#!/bin/bash
cd Today
for file in *; do
  nx=$RANDOM-"$file"
  mv "$file" "$nx"
done

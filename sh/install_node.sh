#!/bin/bash

if [ -z "$1" ]; then
echo "need node major version number"
exit 1
fi


curl -sL "https://deb.nodesource.com/setup_$1.x" | sudo -E bash -
sudo apt-get install -y nodejs

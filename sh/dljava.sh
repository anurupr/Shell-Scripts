#!/bin/bash

#
# Refer : http://stackoverflow.com/a/10959815/839456
#

if [ -z "$1" ] ; then
 echo "need java url..exiting..."
 exit 1
fi

echo "Got url"
echo $1
echo "Downloading to current directory..."
echo `pwd`
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $1

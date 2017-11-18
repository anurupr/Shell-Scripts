#!/bin/bash

ip=$(nmap -sP 192.168.1.0/24 >/dev/null && arp -an | grep "$1" | awk '{print $2}' | sed 's/[()]//g')
echo $ip

#!/bin/bash -e

mkdir -p $BS_OUTPUT
mountpoint $BS_OUTPUT 1> /dev/null && echo "Already mounted"
mountpoint $BS_OUTPUT 1> /dev/null && exit 1

$BS_SU mount //$BS_HOST/$BS_FOLDER $BS_OUTPUT -t cifs -o username=$BS_DOMAIN/$BS_USER,password=$BS_PASSWORD,uid=$(id -u),gid=$(id -g),user,codepage=cp1251,iocharset=utf8


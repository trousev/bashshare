#!/bin/bash -e

mkdir -p $BS_OUTPUT
mountpoint $BS_OUTPUT 1> /dev/null && echo "Already mounted"
mountpoint $BS_OUTPUT 1> /dev/null && exit 1

# $BS_SU echo $BS_PASSWORD | $BS_SU mount $BS_SCHEMA://$BS_HOST/$BS_FOLDER $BS_OUTPUT -t davfs -o uid=$(id -u),gid=$(id -g),user,username=$BS_USER
echo $BS_PASSWORD | $BS_SU mount $BS_HOST $BS_OUTPUT -t davfs -o uid=$(id -u),gid=$(id -g),user,username=$BS_USER


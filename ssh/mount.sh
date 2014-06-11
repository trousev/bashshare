#!/bin/bash -e

mkdir -p $BS_OUTPUT
mountpoint $BS_OUTPUT 1> /dev/null && echo "Already mounted"
mountpoint $BS_OUTPUT 1> /dev/null && exit 1

sshfs $BS_USER@$BS_HOST:$BS_FOLDER $BS_OUTPUT -p $BS_PORT -o reconnect,idmap=user,transform_symlinks,allow_root


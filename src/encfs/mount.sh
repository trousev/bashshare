#!/bin/bash -e

mkdir -p $BS_OUTPUT
mountpoint $BS_OUTPUT 1> /dev/null && echo "Already mounted"
mountpoint $BS_OUTPUT 1> /dev/null && exit 1

encfs $BS_HOST $BS_OUTPUT


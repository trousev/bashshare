#!/bin/bash -e
[ -d $BS_HOST ] || echo "No such directory: $BS_HOST"
[ -d $BS_HOST ] || exit 1

mkdir -p $BS_OUTPUT
mountpoint $BS_OUTPUT 1> /dev/null && echo "Already mounted"
mountpoint $BS_OUTPUT 1> /dev/null && exit 1

cryfs $BS_HOST $BS_OUTPUT


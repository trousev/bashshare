#!/bin/bash -e
source $(dirname $0)/init.sh $(dirname $0)
command="mount"
if [ "$1" == "-" ]; then
    command="umount"
    shift
fi
if [ "$1" == "" ]; then
    echo "USAGE: $0 <share name>"
    exit 1
fi
export BS_NAME=$1
export BS_OUTPUT=$BS_PREFIX/$BS_NAME
source $BS_ROOT/$BS_STORAGE/read.sh
source $BS_ROOT/$BS_TYPE/init.sh
source $BS_ROOT/$BS_TYPE/$command.sh

#!/bin/bash -e
mkdir -p ~/.share/plain
CONF_FILE=~/.share/plain/$BS_NAME.conf
if [ -f $CONF_FILE ]; then
    source $CONF_FILE
else
    echo "No such configuration: $BS_NAME"
    exit 1
fi

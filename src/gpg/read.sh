#!/bin/bash -e
mkdir -p ~/.share/gpg
CONF_FILE=~/.share/gpg/$BS_NAME.conf
if [ -f $CONF_FILE ]; then
    gpg --decrypt $CONF_FILE > ~/.share/gpg/dec.tmp
    source ~/.share/gpg/dec.tmp
    rm ~/.share/gpg/dec.tmp
else
    echo "No such configuration: $BS_NAME"
    exit 1
fi


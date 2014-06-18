#!/bin/bash
if [ "$1" == "" ]; then
    export BS_ROOT=$(dirname $0)
else
    export BS_ROOT=$1
fi

export BS_DRIVERS="ssh smb dav"

if [ -f /etc/sharerc ]; then
  source /etc/sharerc
fi

if [ -f ~/.sharerc ]; then
  source ~/.sharerc
fi

# reconfigurable options
export BS_SU=${BS_SU:-sudo}
export BS_STORAGE=${BS_STORAGE:-plain}
export BS_PREFIX=${BS_PREFIX:-~/Share}

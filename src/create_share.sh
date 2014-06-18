#!/bin/bash -e
source $(dirname $0)/init.sh $(dirname $0)

# hack
PS3='Please, select driver version: '
select BS_TYPE in $BS_DRIVERS
do
    if [ "$BS_TYPE" != "" ]; then break; fi
done
echo -en "\\n\\n"
echo "Share Type: $BS_TYPE"

# export BS_NAME="ssh_test"

source $BS_ROOT/$BS_TYPE/init.sh
export BS_NAME_CAPTION="Share name"
export BS_VARS="$BS_VARS BS_NAME"
for varname in $BS_VARS; do
    while [ true ]; do
        if [ -f $BS_ROOT/$BS_TYPE/read_hook.sh ]; then
            source $BS_ROOT/$BS_TYPE/read_hook.sh
        fi
        rflags=""
        vartitle=${varname}_CAPTION
        vartype=${varname}_TYPE
        vardef=${varname}_DEFAULT
        echo -en "${!vartitle}"
        if [ "${!vardef}" != "" ]; then
          echo -en " (${!vardef})"
        fi
        afterread=""
        if [ "${!vartype}" == "password" ]; then
            rflags=" -s "
            afterread="\\n"
        fi
        echo -en ": "
        read $rflags $varname
        echo -en $afterread
        if [ "${!vardef}" != "" ]; then
            if [ "${!varname}" == "" ]; then
                export $varname=${!vardef}
            fi
        fi
        if [ "${!varname}" != "" ]; then
            break
        fi
    done
done

export BS_VARS="$BS_VARS BS_TYPE"
source $BS_ROOT/$BS_STORAGE/write.sh
echo "Share created. Now You can mount it."


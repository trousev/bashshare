#!/bin/bash -e
export BS_STORAGE=plain

export BS_NAME=test
export BS_VARS="var1 var2 var3 username host"

export var1=foo
export var2=bar
export username=user
export host=example.com

source ../$BS_STORAGE/write.sh
export BS_NAME=test2
export username=test
source ../$BS_STORAGE/write.sh

export BS_NAME=test
source ../$BS_STORAGE/read.sh
[ $username == "user" ] || exit 1


export BS_NAME=test2
source ../$BS_STORAGE/read.sh
[ $username == "test" ] || exit 1


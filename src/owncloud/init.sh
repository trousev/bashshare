#!/bin/bash

source $BS_ROOT/dav/init.sh
BS_VARS="BS_HOST BS_USER BS_PASSWORD"
export BS_SCHEMA="https"
export BS_FOLDER="owncloud/remote.php/webdav"

export BS_SCHEMA_CAPTION="Schema -- http or https"
export BS_SCHEMA_DEFAULT="https"
export BS_HOST_CAPTION="Host name"
export BS_USER_CAPTION="User name"
export BS_PASSWORD_CAPTION="Password"
export BS_PASSWORD_TYPE="password"
export BS_FOLDER_CAPTION="Remote folder"


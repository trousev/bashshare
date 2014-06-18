#!/bin/bash -e
mkdir -p ~/.share/gpg
message=""
for v in $BS_VARS; do
  message="$message$v=${!v}\\n"
done
echo -en $message | gpg --encrypt --armor -r $BS_GPG_EMAIL > ~/.share/gpg/$BS_NAME.conf

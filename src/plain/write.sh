#!/bin/bash -e
mkdir -p ~/.share/plain
echo "# Autogenerated" > ~/.share/plain/$BS_NAME.conf
for v in $BS_VARS; do
  echo export $v=${!v} >> ~/.share/plain/$BS_NAME.conf
done
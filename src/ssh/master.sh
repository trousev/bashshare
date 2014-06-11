#!/bin/bash

#OUT=$(zenity --forms \
#	--add-entry="Remote server" \
#	--add-entry="Username" \
#	--add-entry="Folder name" \
#	--add-entry="port" \
#	--text "New SSH connection")


IFS='|' read -ra ARR <<< "$OUT"
export BS_HOST=${ARR[0]}
export BS_USER=${ARR[1]}
export BS_FOLDER=${ARR[2]}
export BS_PORT=${ARR[3]}

#for i in "${ARR[@]}"; do
#    echo $i
#done


if [ $varname == "BS_FOLDER" ]; then
    echo "Share listing: "
    smbclient -g -L //$BS_HOST -U $BS_DOMAIN/$BS_USER%$BS_PASSWORD 2> /dev/null | grep "Disk|" | sed s/"Disk|"//g | sed s/"|"/"\\t"/g
fi

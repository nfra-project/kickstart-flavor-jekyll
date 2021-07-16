#!/bin/bash

##
# Check server-status for open connection. Wait for these connections
# to close before shutdown

while true
do
    HTTP_RESPONSE=$(curl --silent --write-out "HTTPSTATUS:%{http_code}" -X GET "http://localhost/server-status")
    # extract the status
    HTTP_STATUS=$(echo $HTTP_RESPONSE | tr -d '\n' | sed -e 's/.*HTTPSTATUS://')
    if [ ! $HTTP_STATUS -eq 200  ]; then
        echo "Error [HTTP status: $HTTP_STATUS]"
        echo "Service not running, so killing container"
        exit 0;
    fi
    # extract the body
    HTTP_BODY=$(echo $HTTP_RESPONSE | sed -e 's/HTTPSTATUS\:.*//g')
    pos=`echo $HTTP_BODY | awk '{print match($0, "requests currently being processed")}'`
    if [ "$(echo $HTTP_BODY | cut  -c$((pos-10))-$((pos-1)) | tr -dc '0-9')" -gt 1 ];
    then
        echo "Service is busy"
    else
        echo "Service is idle, so stopping container"
        exit 0;
    fi
    sleep 2
done
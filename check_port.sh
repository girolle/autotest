#!/bin/bash
. /autotest/print_err.sh

PORT_ERR="NOT 3000 PORT"

npm i && npm -s run start &
sleep 20
PORT=$(netstat -an | grep ':3000 ')
if [[ -z $PORT ]]
then
	print_err $PORT_ERR
	exit 0
fi
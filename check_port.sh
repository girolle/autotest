#!/bin/bash
. ./autotest/print_err.sh
. ./autotest/ERRORS_KEYS.sh

npm run start &
sleep 20

PORT=$(netstat -an | grep ':3000 ')
if [[ -z $PORT ]]
then
	print_err $PORT_ERR
	exit 1
fi

exit 0
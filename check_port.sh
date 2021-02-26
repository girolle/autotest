#!/bin/bash
. ./autotest/print_err.sh
. ./autotest/ERRORS_KEYS.sh

echo "here1"
npm run start &
sleep 20
echo "here2"

PORT=$(netstat -an | grep ':3000 ')
if [[ -z $PORT ]]
then
	print_err $PORT_ERR
	exit 1
fi

exit 0
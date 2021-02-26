#!/bin/bash

#wait $(lsof -t -i:3000) 2>/dev/null
#kill $(lsof -t -i:3000)
#KILL=$(echo $$)
#echo "$KILL"

START_ERR="NO START SCRIPT"
PARCEL_ERR="NO PARCEL IN START SCRIPT"
PORT_ERR="NOT 3000 PORT"

function print_err(){
	echo -e "\e[31m$@\e[0m"
}

START=$(npm run | grep "start" -A1)
if [[ -z $START ]]
then
	print_err $START_ERR
	exit 0
fi

PARCEL=$(npm run | grep "start" -A1 | grep "parcel")
if [[ -z $PARCEL ]]
then
	print_err $PARCEL_ERR
	exit 0
fi

npm ci && npm -s run start &
sleep 5
PORT=$(netstat -an | grep ':3000 ')
if [[ -z $PORT ]]
then
	print_err $PORT_ERR
	exit 0
fi
killall node
node run.js

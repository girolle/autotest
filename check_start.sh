#!/bin/bash
. /autotest/print_err.sh

START_ERR="NO START SCRIPT"

START=$(npm run | grep "start" -A1)
if [[ -z $START ]]
then
	print_err $START_ERR
	exit 1
fi

exit 0
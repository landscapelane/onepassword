#!/bin/bash

source ./Constants.sh
source ./Account.sh
source ./Password.sh
source ./Input.sh
source ./Output.sh

CMDS_IDX=0;


CMDS=(
	'[1]. Create a new account'
	'[2]. Login an coount'
	'[3]. Exit'
)
displayCMD(){
	count=0
	while [ "x${CMDS[count]}" != "x" ]
	do
	   printMessage "${CMDS[$count]}"
	   count=$(( $count + 1 ))
	done
}

readyToExit(){
	printMessage "Ready to exit"
	exit
}

readCMD(){
	readInput "Enter your choose:" REQUEST_CMD
	printMessage $REQUEST_CMD
}
processCMD(){
	case $REQUEST_CMD in
	1)
		printMessage "Your choose:${CMDS[0]}"
		createNewAccount
	;;
	2)
		printMessage "Your choose:${CMDS[1]}"
		loginAnAccount
	;;
	3)
		printMessage "Your choose:${CMDS[2]}"
	;;
	*)
		readyToExit
	;;
	esac
	displayCMD
}

displayCMD
readCMD
processCMD


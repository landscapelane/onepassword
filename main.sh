#!/bin/bash


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
	   echo "${CMDS[$count]}"
	   count=$(( $count + 1 ))
	done
}

createNewAccount(){
	echo "Create new account"
	read -p "Account:" NEW_ACCOUNT_NAME
	read -p "Super password:" NEW_ACCOUNT_SUPER_PASSWORD
	read -p "Confirm Super password:" NEW_ACCOUNT_SUPER_PASSWORD_CONFIRM

	echo "Your are creating a new account:${NEW_ACCOUNT_NAME}"
	read -p "Press y to start account:" CONFIRMED
	if [ $CONFIRMED = 'Y' -o $CONFIRMED = 'y'  ]; then
		echo "Creating you new account..."
	fi

}
loginAnAccount(){
	echo "Login an account"
}

readyToExit(){
	echo "Ready to exit"
	exit
}

readCMD(){
	read -p "Enter your choose:" REQUEST_CMD
	echo $REQUEST_CMD
}
processCMD(){
	case $REQUEST_CMD in
	1)
		echo "Your choose:${CMDS[0]}"
		createNewAccount
	;;
	2)
		echo "Your choose:${CMDS[1]}"
		loginAnAccount
	;;
	3)
		echo "Your choose:${CMDS[2]}"
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


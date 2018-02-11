
NEW_ACCOUNT_SUPER_PASSWORD="";
NEW_ACCOUNT_SUPER_PASSWORD_CONFIRM="";

checkNoSuchUser() {
	local ret;
	local ACCOUNT_NAME=$1
	if [ ! -d ${USERS_DIR} ]
	then
		printMessage "No ${USERS_DIR} folders"
		ret=${RET_YES}
	elif [ ! -e ${USERS_DIR}/${ACCOUNT_NAME}.enc ]
	then
		printMessage "No such user file"
		ret=${RET_YES}
	else
		ret=${RET_NO}
	fi
	return $ret;
}

createNewAccount() {
	local ret;
	local NEW_ACCOUNT_NAME;

        printMessage "Create new account"
        readInput "Account:" NEW_ACCOUNT_NAME

	checkNoSuchUser ${NEW_ACCOUNT_NAME}
	if [ $? -eq ${RET_NO} ]
	then
		return ${RET_NO}
	fi

	printMessage "Going to create acoount:[$NEW_ACCOUNT_NAME]"
        readInputPassword "Enter Super password:" NEW_ACCOUNT_SUPER_PASSWORD
        readInputPassword "Confirm Super password:" NEW_ACCOUNT_SUPER_PASSWORD_CONFIRM
	ComparePasswords $NEW_ACCOUNT_SUPER_PASSWORD $NEW_ACCOUNT_SUPER_PASSWORD_CONFIRM
	if [ $? -eq ${SAME_PASSWORD} ]; then
		printMessage "Same password!"
	else
		printMessage "Different password !"
	fi
	
        printMessage "Your are creating a new account:${NEW_ACCOUNT_NAME}"
        readOneChar "Press y to confirm:" CONFIRMED
        if [ $CONFIRMED = 'Y' -o $CONFIRMED = 'y'  ]; then
                printMessage "Creating your new account..."
		creatPasswordFile
		return ${RET_YES}
	else
		return ${RET_NO}
        fi



}

loginAnAccount(){
	local ret;
	local ACCOUNT_NAME;
	local ONE_PASSWORD;

	printMessage "Login an account"

        printMessage "Enter you account name:"
        readInput "Account:" ACCOUNT_NAME

	checkNoSuchUser ${ACCOUNT_NAME}
	if [ $? -eq ${RET_YES} ]
	then
		printMessage "Can't find account:${ACCOUNT_NAME}"
		return ${RET_NO}
	fi

	readInput "Enter your onepassword:" ONE_PASSWORD
	printMessage "Your onepassword:${ONE_PASSWORD}"

	veirfyPassword ${ACCOUNT_NAME} ${ONE_PASSWORD}
	if [ $? -eq ${RET_YES} ]
	then
		printMessage "Your password is verified"
		ret=${RET_YES}
	else
		printMessage "Your password is incorrect"
		ret=${RET_NO}
	fi
	return ${RET_YES}
}



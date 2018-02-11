
NEW_ACCOUNT_SUPER_PASSWORD="";
NEW_ACCOUNT_SUPER_PASSWORD_CONFIRM="";

createNewAccount(){
        printMessage "Create new account"
        readInput "Account:" NEW_ACCOUNT_NAME
	printMessage "here, $NEW_ACCOUNT_NAME"
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
		decryptPasswordFile
        fi



}


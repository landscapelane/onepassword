
SAME_PASSWORD=1;
DIFF_PASSWORD=0;
OPENSSL_ENC="openssl enc -aes-256-cbc -salt "
OPENSSL_DEC="openssl enc -aes-256-cbc -d "
USERS_DIR="./users"

ComparePasswords()
{
	if [ $1 = $2 ]; then
		return ${SAME_PASSWORD};
	else
		return ${DIFF_PASSWORD};
	fi

}

creatPasswordFile()
{
	if [ ! -d ${USERS_DIR} ]
	then
		printMessage "Create user folder"
		mkdir ${USERS_DIR}
	fi
	if [ $? -eq 0 ]
	then
		echo "Sample context" | ${OPENSSL_ENC} -out ${USERS_DIR}/${NEW_ACCOUNT_NAME}.enc -k ${NEW_ACCOUNT_SUPER_PASSWORD}
	fi
}

decryptPasswordFile()
{
	${OPENSSL_DEC} -in ${USERS_DIR}/${NEW_ACCOUNT_NAME}.enc -out ${USERS_DIR}/${NEW_ACCOUNT_NAME}.out -k ${NEW_ACCOUNT_SUPER_PASSWORD}
	echo "Decrypt file context:"
	cat ${USERS_DIR}/${NEW_ACCOUNT_NAME}.out
}

veirfyPassword()
{
	local RET;
	local ACCOUNT_NAME=$1
	local PASSWORD=$2
	
	`cat ${USERS_DIR}/${ACCOUNT_NAME}.enc | $OPENSSL_DEC -k ${PASSWORD} > /dev/null 2>&1`
	if [ $? -eq 0 ]
	then
		RET=${RET_YES}
	else
		RET=${RET_NO}
	fi
	return ${RET}
}


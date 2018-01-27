
SAME_PASSWORD=1;
DIFF_PASSWORD=0;

ComparePasswords()
{
	if [ $1 = $2 ]; then
		return ${SAME_PASSWORD};
	else
		return ${DIFF_PASSWORD};
	fi

}

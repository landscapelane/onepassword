
readInput(){
	read -p "$1" $2
}
function readInputPassword(){
	#eval PROMT_MESG="$1"
	read -e -p "$1" $2
}
readOneChar(){
	read -n 1 -p "$1" $2
}

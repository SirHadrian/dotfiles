#!/bin/zsh

if [ -e $HOME/.zshrc ]; then
	source $HOME/.zshrc
fi

usage(){
	echo "Execute a commnad n times"
	echo "-n | --time - duration in seconds"
	echo "-e | --exec - commnad to execute every n times"
	echo "-h | --help - print usage"
	return
}

runTime=
commandToRun=

while [[ -n "$1" ]]
do
	case "$1" in
		-n | --time)
			shift
			runTime=$1
			;;
		-e | --exec)
			shift
			commandToRun="$1"
			;;
		-h | --help)
			usage
			exit
			;;
		*)
			usage >&2
			exit 1
			;;
	esac
	shift
done

if [[ -z "$runTime" || -z "$commandToRun" ]]
then
	usage >&2
	exit 1
fi

while true
do
	eval "$commandToRun"
	sleep $runTime
done

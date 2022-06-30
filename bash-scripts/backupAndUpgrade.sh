#!/bin/bash

backup-system () {
	echo "---BACKUP START---"
	if [ -z "$1" ]
	then
		echo "Error: No timeshift comment was supplied" >&2
		return 1
	fi
	sudo timeshift --create --comments "$1"
	status=$?
	echo "---BACKUP END---"
	return $status
}

upgrade-system () {
	echo "---UPGRADE START---"
	sudo dnf upgrade -y
	status=$?
	echo "---UPGRADE END---"
	return $status
}

backup-system "$1" && upgrade-system

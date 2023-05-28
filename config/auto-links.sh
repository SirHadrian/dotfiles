#!/usr/bin/bash

declare -a selected=()

function mark {
	local choice=$1
	if [[ ${selected[choice]} ]]; then
		selected[choice]=
	else
		selected[choice]=+
	fi
}

PS3="Select configs: "
loop=true
declare -a configs=("alacritty" "fish")
while $loop; do
	clear

	declare -a options=("${configs[0]} ${selected[0]}" "${configs[1]} ${selected[1]}" "Done")

	select i in "${options[@]}"; do
		case "$i" in
		"alacritty ${selected[0]}")
			mark 0
			break
			;;
		"fish ${selected[1]}")
			mark 1
			break
			;;
		"Done")
			loop=false
			break
			;;
		*)
			loop=false
			break
			;;
		esac
	done
done

printf '%s\n' 'Options chosen:'
for opt in "${!selected[@]}"; do
	if [[ ${selected[opt]} ]]; then
		printf '%s\n' "${configs[opt]}"
	fi
done

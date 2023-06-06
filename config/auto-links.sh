#!/usr/bin/bash

declare -a selected=()

function mark {
	local choice=$1
	if [[ ${selected[choice]} ]]; then
		selected[choice]=
	else
		selected[choice]='*'
	fi
}

PS3="Select configs: "
loop=true
declare -A config_location=(
	["alacritty"]="$HOME/.config/alacritty/alacritty.yml"
	["fish"]="$HOME/.config/fish/config.fish"
	["redshift"]="$HOME/.config/redshift/redshift.conf"
)
declare -a configs=("alacritty" "fish" "redshift")

while $loop; do
	clear

	declare -a options=("${configs[0]} ${selected[0]}" "${configs[1]} ${selected[1]}" "${configs[2]} ${selected[2]}" "Done")
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
		"redshift ${selected[2]}")
			mark 2
			break
			;;
		"Done")
			loop=false
			break
			;;
		*)
			break
			;;
		esac
	done
done

declare -a keys=()
printf '\n%s\n' 'Options chosen:'
for opt in "${!selected[@]}"; do
	if [[ ${selected[opt]} ]]; then
		keys+=("${configs[opt]}")
		printf '%s\n' "${configs[opt]}"
	fi
done

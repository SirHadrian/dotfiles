#!/usr/bin/env bash

install_ranger() {
	CONFIGDIR=$HOME'/.config/ranger'

	[[ ! -d $CONFIGDIR ]] && mkdir "$CONFIGDIR"

	cp rc.conf rifle.conf scope.sh "$CONFIGDIR"

	if [[ -x $(command -v pacman) ]]; then
		# Refresh pkg database
		#sudo pacman -Syy
		# Check if ranger is installed
		[[ -x $(command -v ranger) ]] || sudo pacman -S --needed --noconfirm ranger

		# Images thumbnails
		# For pictures preview
		sudo pacman -S --needed --noconfirm ueberzug

		# For epub preview
		# Check if pip is installed
		[[ -x $(command pip) ]] || sudo pacman -S --needed --noconfirm python-pip

		# Install Pillow dependecy if not installed'
		[[ $(python -c "import PIL") ]] && pip install Pillow

		# Build epub-thumbnailer from source and clean
		git clone https://github.com/marianosimone/epub-thumbnailer.git && sudo python epub-thumbnailer/install.py install && rm -rf epub-thumbnailer

		# Video thumbnailer
		sudo pacman -S --needed --noconfirm ffmpeg ffmpegthumbnailer

		# Ranger icons
		git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
		echo "default_linemode devicons" >>"$CONFIGDIR"/rc.conf

	else
		echo "Could not execute pacman"
		exit 1
	fi
}

# Ask for confirmation
read -rp "Do you want to install ranger? (Y/n)" answer

doInstall=${answer:-Y}

case $doInstall in
[Yy]) install_ranger ;;
[Nn]) exit 0 ;;
*)
	echo "Incorrect option"
	exit 1
	;;
esac

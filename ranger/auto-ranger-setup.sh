#!/bin/bash

# Refresh pkg database
sudo pacman -Syy

[[ ! $(which ranger) ]] && sudo pacman -S --needed --noconfirm ranger

CONFIGDIR=$HOME'/.config/ranger'

echo $CONFIGDIR

[[ ! -d $CONFIGDIR ]] && mkdir $CONFIGDIR

cp rc.conf rifle.conf scope.sh $CONFIGDIR

if [[ $(which pacman) ]]; then
    # Images thumbnails
    # For pictures preview
    sudo pacman -S --needed --noconfirm ueberzug

    # For epub preview
    # Check if pip is installed
    if [[ ! $(which pip) ]]; then
        sudo pacman -S --needed --noconfirm python-pip
    fi
    # Install Pillow dependecy if not installed'
    if [[ $(python -c "import PIL") ]]; then
        pip install Pillow
    fi
    # Build epub-thumbnailer from source and clean
    git clone https://github.com/marianosimone/epub-thumbnailer.git && sudo python epub-thumbnailer/install.py install && rm -rf epub-thumbnailer

elif [[ $(which dnf) ]]; then
    echo "TODO FEDORA"
else
    exit 1
fi

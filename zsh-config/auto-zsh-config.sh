#!/bin/bash

install_zsh() {
    if [[ $(which pacman) ]]; then
        # Check if zsh is installed
        [[ ! $(which zsh) ]] && sudo pacman -S --noconfirm zsh
        # Check if curl is installed on system
        [[ ! $(which curl) ]] && sudo pacman -S --noconfirm curl
        # Install oh_my_zsh
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        # Get powerlevel10k theme
        git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

        # Get zsh sysntax-highlighting and autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

        cp .zshrc ~/.zshrc
    fi
}

# Ask for confirmation
defaultValue=Y
read -p "Do you want to install zsh? (Y/n)" answer

doInstall=${answer:-$defaultValue}

case $doInstall in
[Yy]) install_zsh ;;
[Nn]) exit 0 ;;
*)
    echo "Incorrect option"
    exit 1
    ;;
esac

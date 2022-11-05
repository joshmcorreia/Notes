#!/bin/bash

# Tested on the following:
# Ubuntu 20.04 (root and non-root user)
# Linux Mint (non-root user)
# Docker ubuntu:focal (root user)
# Docker ubuntu:jammy (root user)
# Docker rockylinux:8.6 (root user)

set -e

username=$(whoami)

install_zsh() {
    echo "Checking if 'zsh' is installed..."
    if [ -x "$(command -v zsh)" ]; then
        echo -e "'zsh' is already installed\n"
        return
    fi

    echo "Installing 'zsh'..."

    if [ -x "$(command -v dnf)" ]; then
        if [ "$username" = "root" ]; then
            dnf install -y zsh
        else
            sudo dnf install -y zsh
        fi
        echo -e "Successfully installed 'zsh'\n"
        return
    fi

    if [ -x "$(command -v apt)" ]; then
        if [ "$username" = "root" ]; then
            apt install -y zsh
        else
            sudo apt install -y zsh
        fi
        echo -e "Successfully installed 'zsh'\n"
        return
    fi

    if [ -x "$(command -v brew)" ]; then
        brew install zsh
        echo -e "Successfully installed 'zsh'\n"
        return
    fi

    echo "ERROR: This script does not currently support your package manager"
    exit 1
}

change_user_shell() {
    echo "Changing the current user's shell..."

    # change the user's shell with sudo if they are already logged so they don't have to input their password
    if [ -x "$(command -v chsh)" ]; then
        if sudo -n true 2>/dev/null; then
            sudo chsh -s /bin/zsh $username
        else
            chsh -s /bin/zsh
        fi
        echo -e "Successfully changed the current user's shell\n"
        return
    fi

    # support Rocky Linux/RHEL which don't come with chsh by default
    if [ -x "$(command -v usermod)" ]; then
        usermod -s /bin/zsh $username
        echo -e "Successfully changed the current user's shell\n"
        return
    fi

    echo "ERROR: Unable to find 'chsh' or 'usermod'!"
    exit 1
}

download_zshrc() {
    echo "Downloading '.zshrc'..."

    if [ -x "$(command -v curl)" ]; then
        echo "'curl' found, using curl to download '.zshrc'..." >&2
        curl https://raw.githubusercontent.com/joshmcorreia/Notes/main/Terminal%20Settings/.zshrc -o zshrc.tmp
        echo -e "Successfully downloaded '.zshrc'\n"
        return
    fi

    if [ -x "$(command -v wget)" ]; then
        echo "'wget' found, using wget to download '.zshrc'..." >&2
        wget https://raw.githubusercontent.com/joshmcorreia/Notes/main/Terminal%20Settings/.zshrc -O zshrc.tmp
        echo -e "Successfully downloaded '.zshrc'\n"
        return
    fi

    echo "Unable to find either 'curl' or 'wget'"
    echo "Installing 'curl'..."
    if [ "$username" = "root" ]; then
        apt install -y curl
    else
        sudo apt install -y curl
    fi
    echo -e "Successfully installed curl\n"

    download_zshrc
}

move_zshrc_file() {
    echo "Creating '.zshrc'..."

    if [ -f $HOME/.zshrc ]; then
        while true; do
            read -p "$HOME/.zshrc already exists. Do you want to replace it? " yn
            case $yn in
                [Yy]* ) break;;
                [Nn]* ) rm zshrc.tmp; exit;;
                * ) echo "Please answer yes or no.";;
            esac
        done
    fi
    mv zshrc.tmp $HOME/.zshrc
    echo "Successfully created '.zshrc'"
}

install_zsh
change_user_shell
download_zshrc
move_zshrc_file
zsh

#!/bin/bash

set -e

username=$(whoami)
echo $username

download_zshrc() {
    if [ -x "$(command -v curl)" ]; then
        echo "'curl' found, using curl to download '.zshrc'..." >&2
        curl https://raw.githubusercontent.com/joshmcorreia/Notes/main/Terminal%20Settings/.zshrc -o zshrc.tmp
        return
    fi

    if [ -x "$(command -v wget)" ]; then
        echo "'wget' found, using wget to download '.zshrc'..." >&2
        wget https://raw.githubusercontent.com/joshmcorreia/Notes/main/Terminal%20Settings/.zshrc -O zshrc.tmp
        return
    fi

    echo "ERROR: Unable to download '.zshrc' because neither 'curl' nor 'wget' were found on the system"
    exit 1
}

move_zshrc_file() {
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
}

download_zshrc
move_zshrc_file

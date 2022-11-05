#!/bin/bash

set -e

username=$(whoami)

install_zsh() {
    echo "Checking if 'zsh' is installed..."
    if [ -x "$(command -v zsh)" ]; then
        echo -e "'zsh' is already installed\n"
        return
    fi

    echo "Installing 'zsh'..."

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
}

change_user_shell() {
    echo "Changing the current user's shell..."

    # change the user's shell with sudo if they are already logged so they don't have to input their password
    if sudo -n true 2>/dev/null; then
        sudo chsh -s /bin/zsh $username
    else
        chsh -s /bin/zsh
    fi

    echo -e "Successfully changed the current user's shell\n"
}

download_zshrc() {
    echo "Downloading '.zshrc'..."

    if [ -x "$(command -v curl)" ]; then
        echo "'curl' found, using curl to download '.zshrc'..." >&2
        curl -s https://raw.githubusercontent.com/joshmcorreia/Notes/main/Terminal%20Settings/.zshrc -o zshrc.tmp
        echo -e "Successfully downloaded '.zshrc'\n"
        return
    fi

    if [ -x "$(command -v wget)" ]; then
        echo "'wget' found, using wget to download '.zshrc'..." >&2
        wget -q https://raw.githubusercontent.com/joshmcorreia/Notes/main/Terminal%20Settings/.zshrc -O zshrc.tmp
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

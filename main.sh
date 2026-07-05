#!/usr/bin/env bash

# Declare script's run directory
SCRIPTDIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Delete old/misconfigured OhMyZsh files
printf "Attempting to delete old/misconfigured OhMyZsh files...\n"

if [ -d "$HOME/.oh-my-zsh" ] || [ -d "$HOME/oh-my-zsh" ]; then
    rm -rf $HOME/.oh-my-zsh $HOME/oh-my-zsh
fi

if [ -d "$HOME/.config/.oh-my-zsh" ] || [ -d "$HOME/.config/oh-my-zsh" ]; then
    rm -rf $HOME/.config/.oh-my-zsh $HOME/.config/oh-my-zsh
fi

if [ -d "$HOME/.config/zsh/ohmyzsh" ] || [ -d "$HOME/.config/zsh/.ohmyzsh" ]; then
    rm -rf $HOME/.config/zsh/ohmyzsh $HOME/.config/zsh/.ohmyzsh
fi

if [ -d "$HOME/.config/zsh/oh-my-zsh" ] || [ -d "$HOME/.config/zsh/.oh-my-zsh" ]; then
    rm -rf $HOME/.config/zsh/oh-my-zsh $HOME/.config/zsh/.oh-my-zsh
fi

sleep 0.5

printf "Installing Oh My Zsh\n"
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
sleep 0.5

printf "Configuring OhMyZsh Installation...\n"
if [ -d "$HOME/.oh-my-zsh" ]; then
    mv "$HOME/.oh-my-zsh" "$HOME/.config/oh-my-zsh"
    printf "Moved oh-my-zsh folder to .config/"
    sleep 0.5
else
    printf ".oh-my-zsh/ not found in home directory."
    sleep 0.5
    exit 1
fi

printf "Importing preconfigured .zshrc and .zshenv files...\n"
printf "Creating $HOME/.config/zsh/ if necessary..."
if [ ! -d "$HOME/.config/zsh" ]; then
    mkdir -p "$HOME/.config/zsh"
    printf "Created $HOME/.config/zsh/"
    sleep 0.5
else
    printf "$HOME/.config/zsh/ already exists. Skipping..."
    sleep 0.5
fi

cp "$SCRIPTDIR/.zshrc" "$HOME/.config/zsh"
cp "$SCRIPTDIR/.zshenv" "$HOME"
printf "Copied .zshrc to $HOME/.config/zsh/"
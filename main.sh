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
printf "Copied .zshenv to $HOME"
sleep 0.5

printf "Importing preconfigured .bashrc and 10-xdg-env.conf...\n"
printf "Creating $HOME/.config/environment.d/ if necessary..."
if [ ! -d "$HOME/.config/environment.d" ]; then
    mkdir -p "$HOME/.config/environment.d"
    printf "Created $HOME/.config/environment.d/"
else
    printf "$HOME/.config/environment.d/ already exists. Skipping..."
    sleep 0.5
fi

cp "$SCRIPTDIR/.bashrc" "$HOME/.bashrc"
cp "$SCRIPTDIR/10-xdg-env.conf" "$HOME/.config/environment.d"
printf "Copied .bashrc to $HOME"
printf "Copied 10-xdg-env.conf to $HOME/.config/environment.d/"
sleep 0.5


echo "Creating standard directories if necessary."

if [ ! -d "$HOME/Downloads" ]; then
    echo "Downloads folder doesn't exist. Creating..."
    mkdir $HOME/Downloads
else
    echo "Downloads folder exists. Skipping..."
fi

sleep 0.5

if [ ! -d "$HOME/Desktop" ]; then
    echo "Desktop folder doesn't exist. Creating..."
    mkdir $HOME/Desktop
else
    echo "Desktop folder exists. Skipping..."
fi

sleep 0.5

if [ ! -d "$HOME/Documents" ]; then
    echo "Documents folder doesn't exist. Creating..."
    mkdir $HOME/Documents
else
    echo "Documents folder exists. Skipping..."
fi

sleep 0.5

if [ ! -d "$HOME/Music" ]; then
    echo "Music folder doesn't exist. Creating..."
    mkdir $HOME/Music
else
    echo "Music folder exists. Skipping..."
fi

sleep 0.5

if [ ! -d "$HOME/Pictures" ]; then
    echo "Pictures folder doesn't exist. Creating..."
    mkdir $HOME/Pictures
else
    echo "Pictures folder exists. Skipping..."
fi

sleep 0.5

if [ ! -d "$HOME/Videos" ]; then
    echo "Videos folder doesn't exist. Creating..."
    mkdir $HOME/Videos
else
    echo "Videos folder exists. Skipping..."
fi

sleep 0.5

if [ ! -d "$HOME/Templates" ]; then
    echo "Templates folder doesn't exist. Creating..."
    mkdir $HOME/Templates
else
    echo "Templates folder exists. Skipping..."
fi

sleep 0.5

if [ ! -d "$HOME/Public" ]; then
    echo "Public folder doesn't exist. Creating..."
    mkdir $HOME/Public
else
    echo "Public folder exists. Skipping..."
fi

sleep 0.5


echo "Creating XDG Base Directories if necessary..."

if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
    echo "Created .config/"
else
    echo ".config/ exists. Skipping..."
fi

sleep 0.5

if [ ! -d "$HOME/.cache" ]; then
    mkdir $HOME/.cache
    echo "Created .cache/"
else
    echo ".cache/ exists. Skipping..."
fi

sleep 0.5

if [ ! -d "$HOME/.local/share" ]; then
    mkdir -p $HOME/.local/share
    echo "Created .local/share/"
else
    echo ".local/share/ exists. Skipping..."
fi

sleep 0.5

if [ ! -d "$HOME/.local/state" ]; then
    mkdir -p $HOME/.local/state
    echo "Created .local/state/"
else
    echo ".local/state/ exists. Skipping..."
fi

sleep 0.5
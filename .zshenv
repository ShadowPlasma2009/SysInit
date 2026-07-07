# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Android, Gradle
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"

# Rust & Cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Node, Docker & Go
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GOPATH="$XDG_DATA_HOME/go"

# History Files Specification
export PYTHONHISTORY="$HOME/.cache/python_history"
export LESSHISTORYFILE="$HOME/.cache/less_history"
export HISTFILE="$HOME/.cache/zsh_history"

# Miscellaneous
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config"
export LANG=en_US.UTF-8
if command -v micro &> /dev/null; then
    export EDITOR=micro
else
    export EDITOR=nano
fi

export ZDOTDIR="$HOME/.config/zsh"
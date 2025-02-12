# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# ZSH
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# User Scripts
export PATH=$HOME/.local/bin:$PATH

# Default Editor
export EDITOR='micro'

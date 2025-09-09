# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# I18n
export LANG=en_US.UTF-8

# ZSH
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Brew
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/homebrew/Brewfile

# User Scripts
export PATH=$HOME/.local/bin:$PATH

# Default Editor
export EDITOR='micro'

# Load Extras
setopt nullglob
for fragment in "$ZDOTDIR/.zshenv-"* "$XDG_CONFIG_HOME/shell/env.d/"*; do
    [ -f "$fragment" ] && source "$fragment"
done
unsetopt nullglob

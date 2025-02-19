# Use XDG dirs
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh

# Use Homebrew from $HOME if available
if [[ -f "$HOME/homebrew/bin/brew" ]] then
  export PATH=$HOME/homebrew/bin:$PATH
fi

# Set Brew Environment variables
if command -v brew 2>&1 >/dev/null; then
  eval "$(brew shellenv)"
fi

# Setup Prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.yaml)"
else
  export PS1="%~"$'\n'"%(!.#.$) "
fi

# Sessions
export SHELL_SESSION_DIR=$XDG_STATE_HOME/zsh/sessions
export SHELL_SESSION_FILE=$SHELL_SESSION_DIR/$TERM_SESSION_ID

# Configure History
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTORY_BASE="$XDG_STATE_HOME"/zsh/directory_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Setup Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add Zsh plugins
zinit light zsh-users/zsh-completions

# Add Snippets
zinit snippet OMZP::git
zinit snippet OMZP::npm
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::per-directory-history/per-directory-history.zsh

# Load Completions
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
zinit cdreplay -q

# Load Plugins after Completions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Completion Styling
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --use-on-cd)"

# Load Extras
source <(find . -maxdepth 1 -name '.zshrc-*' -exec cat {} +)

# Aliases
alias ls='ls --color'
alias la='ls -la'
alias vim='nvim'
alias c='clear'
alias m="micro"
alias ni="npm install"
alias gupi="gup && npm install"
alias gwip='git commit -a -m "wip"'

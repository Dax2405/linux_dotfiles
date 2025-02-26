
# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light psprint/zsh-navigation-tools
zinit light dvorka/hstr  # CLI history manager (Ctrl-R replacement)
zinit light ohmyzsh/ohmyzsh plugins/git-extras

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# ----------------------------    Aliases   ----------------------------
export LS_COLORS="$(vivid generate one-dark)"
alias ls='lsd --group-dirs=first --color=auto'
alias ll='lsd -lh'
alias la='lsd -lha'
alias c='clear'

# Git
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias gcb='git checkout -b'

# Docker
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dps='docker ps'
alias drm='docker rm $(docker ps -aq)'
alias drmi='docker rmi $(docker images -q)'

# Java
alias javacomp="javac -Xlint:unchecked"

# Python
alias py='python'
alias pipi='pip install'
alias venv="python -m venv .venv && source .venv/bin/activate"

# System shortcuts
alias cls='clear'
alias reload='exec zsh'
alias szsh='source ~/.zshrc'

# Neovim shortcuts
alias vim='nvim'
alias vi='nvim'
alias v='nvim'


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH


function auto_venv() {
  if [ -e ".venv/bin/activate" ]; then
    source .venv/bin/activate
  fi
}
chpwd_functions+=auto_venv

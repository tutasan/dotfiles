# Path to your oh-my-zsh installation.
export "ZSH=$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git)

# User configuration

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Lines configured by zsh-newuser-install
#HISTFILE=~/.histfile
#setopt extendedhistory
#setopt sharehistory

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

# === alias ===

alias ...='cd ../..'
alias ....='cd ../../..'
alias la='ls -la'
alias ll='ls -la'
alias be="bundle exec "
alias reload!="source ~/.zshrc"
alias rpsec_tests='git status | grep spec'
alias awk=gawk
alias date=gdate
alias sed=gsed
alias tac=gtac
alias split=gsplit
alias phis=cool-peco-history
alias pfi=cool-peco-filename-search
alias pgb=cool-peco-git-checkout
alias pgl=cool-peco-git-log
alias pps=cool-peco-ps
alias top=htop
alias 'gcm'='git commit --verbos'

# === PATH ===

#PATH="/bin:$PATH"
#PATH="/sbin:$PATH"
#PATH="/usr/bin:$PATH"
#PATH="/usr/sbin:$PATH"
#PATH="/usr/local/bin:$PATH"
#PATH="/opt/ImageMagick/bin:$PATH"
PATH="$HOME/.rbenv/bin:$PATH"
PATH="$HOME/.rbenv/shims:$PATH"
PATH="/usr/local/share/npm/bin:$PATH"
PATH="/usr/local/go/bin:$PATH"
PATH="/usr/local/Cellar/git/2.24.1/bin:$PATH"
PATH="/usr/local/opt/mysql@5.5/bin:$PATH"

export PATH

typeset -U path PATH

# Java
export JAVA_HOME=`/usr/libexec/java_home`

# === init ===

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
eval "$(pyenv init -)"

# === ENVIROMENT VARIABLES ===

export EDITOR=vim
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh  %s'

# === _kill-backward-blank-words ===

function _kill-backward-blank-word() {
    # 現在位置から左のスペースまでをkillする
    zle set-mark-command
    zle vi-backward-blank-word
    zle kill-region
}

zle -N _kill-backward-blank-word
bindkey '^Q' _kill-backward-blank-word

# === PROMPT init ===

function str_with_color() {
    echo "%{$fg[$1]%}$2%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_ADDED=$(str_with_color cyan '+')
ZSH_THEME_GIT_PROMPT_MODIFIED=$(str_with_color yellow '*')
ZSH_THEME_GIT_PROMPT_DELETED=$(str_with_color red 'x')
ZSH_THEME_GIT_PROMPT_RENAMED=$(str_with_color blue 'o')
ZSH_THEME_GIT_PROMPT_UNMERGED=$(str_with_color magenta '!')
ZSH_THEME_GIT_PROMPT_UNTRACKED=$(str_with_color grey '?')

DATE_TIME=$(str_with_color yellow '%D{%Y-%m-%d %K:%M:%S}')
PROMPT_PREFIX=$(str_with_color white '#')
SEPARATOR1=$(str_with_color white '|')
USER_NAME=$(str_with_color blue '%n')
SEPARATOR2=$(str_with_color white '@')
HOST_NAME=$(str_with_color cyan '%m')
SEPARATOR3=$(str_with_color white ':')
CURRENT_DIRECTORY=$(str_with_color green '%~')
PROMPT_CHAR=$(str_with_color white '> ')
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} ${CURRENT_DIRECTORY} $(git_prompt_info)
$PROMPT_CHAR'
PROMPT2=$(str_with_color white '> ')

RPROMPT='${DATE_TIME}'

# === GCPSDK init ===

if [ -f $HOME/google-cloud-sdk/path.zsh.inc ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc"
fi

if [ -f $HOME/google-cloud-sdk/completion.zsh.inc ]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# === cool-peco init ===

export FPATH="$FPATH:$HOME/.peco/cool-peco"
autoload -Uz cool-peco
cool-peco

bindkey "^r" 'cool-peco-history'
bindkey "^f" 'cool-peco-filename-search'
bindkey '^h' 'cool-peco-ssh'
bindkey '^p' 'cool-peco-ps'

# === history init ===

unalias history
export HISTSIZE=3000
export SAVEHIST=100000

# === others ====

eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

# === load specify settings ===

if [ -f $HOME/.other_zshrc.sh ]; then
	source "$HOME/.other_zshrc.sh"
fi

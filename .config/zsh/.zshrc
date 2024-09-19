# [[ $- != *i* ]] && return # idk why would it be tho...

. ~/.cargo/env
. ~/.config/zsh/modes.sh

# ls colors
eval "$(dircolors -b)"

# history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${HOME}/.cache/zsh_history"

setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_save_no_dups

# change word-style
autoload -U select-word-style
select-word-style b

# options
setopt extendedglob
setopt auto_pushd

# keybinds
bindkey -e
bindkey '^[[Z' reverse-menu-complete

bindkey "^[[1;3C" forward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;5D" backward-word

bindkey "^[n" backward-word
bindkey "^[m" forward-word

# completions
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}:ma=48;5;8;38;5;15"

# prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


# ls aliases
alias ls="lsd --color=auto"
alias l="ls -lh"
alias la="ls -lah"
alias ll="ls -lh"
alias tree="ls --tree"
alias lt="l -t"

# set bat as help pager
alias -g -- --help='--help 2>&1 | batcat --language=help --style=plain'

# useful cd aliases
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias .......="cd ../../../../../../"

# aliases
alias rz="exec zsh"
alias venv="source src_venv"
alias ex="source src_example"
alias ap="source src_add_path"
alias info="pinfo "
alias bat="batcat "
alias img="nsxiv "
alias xclip="xclip -selection clipboard"
alias d="diff --color -u "
alias rgf="rg --files | rg "
alias 7z="7zz" # for whatever reason 7z provides 7zz binary in debian
alias wt="watch -d -cn 0.1 "
alias cal="ncal -b"
alias .e="source .env"
alias tp="taskell ${HOME}/.projects.md"

# function aliases
bl()     { brightnessctl set "$1"% &> /dev/null; }
nosw()   { alacritty --class 'noswallow' -e "$@"; }; compdef _command nosw
t()      { taskell "${1:-${HOME}/.taskell.md}"; }
vims()   { vim "$(whereis "$1" | rev | cut -d ' ' -f 1 | rev)"; }; compdef _command vims
bc()     { unbuffer "$@" | bat; }; compdef _command bc

# compdef
compdef -a '_git; _git-commit' gdc # todo
compdef '_files -g "*.md"' md

# git aliases
gl() { git log "$@" | bat }; compdef '_git; _git-log' gl
alias gs="git status"
alias gc="git commit"
alias gca="git commit --amend --no-edit"
alias gp="git push"
alias ga="git add"
alias gck="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gr="git restore"
alias gr="git reset"
alias gcl="git clone"
alias gds="gd --staged"

# docker aliases
alias dc="docker compose"
alias docker!="DOCKER_HOST=ssh://docker /usr/bin/docker"
alias dc!="docker! compose"

# tmux stuff
tn() { tmux new-session -s "${1-"$(basename "$(pwd)")"}" }
alias ta="tmux a -t"

# disable xon controll chars
stty -ixon

# print tasks on startup
cat ~/.taskell.md | grep -v '>.*'

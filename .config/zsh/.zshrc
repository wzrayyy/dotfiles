[[ $- != *i* ]] && return

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
alias venv="source _venv"
alias cdb="compiledb "
alias info="pinfo "
alias bat="batcat "
alias img="nsxiv "
alias xclip="xclip -selection clipboard"
alias d="diff --color -u "

# function aliases
bl ()    { brightnessctl set $1% &> /dev/null }
clines() { find $@ \( -name '*.cpp' -o -name '*.[ch]' \) -a ! -path '*cmake-build*' | xargs wc -l }
nosw()   { alacritty --class 'noswallow' -e "$@" }; compdef _command nosw
t()      { if [ -z "$1" ]; then taskell ~/.taskell.md; else taskell "$1"; fi }

# git aliases
alias gitignore="cp ${HOME}/.local/share/gitignore-template ./.gitignore"
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gl="git log"
alias ga="git add"
alias gck="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gr="git restore"

# disable xon controll chars
stty -ixon

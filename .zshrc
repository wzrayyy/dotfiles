# history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$HOME/.cache/zsh_history"

# misc
setopt extendedglob
bindkey -e

# completions
zstyle :compinstall filename '/home/wzray/.zshrc'
autoload -Uz compinit
compinit

# prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# ls aliases
alias ls="ls --color=auto"
alias la="ls -lAh"
alias ll="ls -lh"

# aliases
alias dt="git --git-dir=$HOME/.dotfiles/git --work-tree=$HOME"
alias rz="exec zsh"
alias bat="batcat"

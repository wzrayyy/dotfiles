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


bindkey "^[^H" backward-word
bindkey "^[^L" forward-word
bindkey "^[h" backward-char
bindkey "^[f" forward-char

# completions
autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit;
else
    compinit -C;
fi;

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
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# useful cd aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"

# aliases
alias dt="git --git-dir=$HOME/.dotfiles/git --work-tree=$HOME"
alias rz="exec zsh"
alias reload_completion="autoload -Uz compinit && compinit"
alias gitignore="cp ${HOME}/.local/share/gitignore-template ./.gitignore"
alias venv="source _venv"

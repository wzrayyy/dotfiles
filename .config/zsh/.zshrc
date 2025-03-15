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
setopt inc_append_history

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
bindkey "^[[3~" delete-char

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
alias lt="ls --color=always --icon=always -lt"

# set bat as help pager
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain --theme Monokai\ Extended'

# useful cd aliases
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias .......="cd ../../../../../../"
alias ........="cd ../../../../../../../"
alias .........="cd ../../../../../../../../"
alias ..........="cd ../../../../../../../../../"
alias ...........="cd ../../../../../../../../../../"
alias ............="cd ../../../../../../../../../../../"
alias .............="cd ../../../../../../../../../../../../"
alias ..............="cd ../../../../../../../../../../../../../"
alias ...............="cd ../../../../../../../../../../../../../../"

# aliases
alias rz="exec zsh"
alias venv="source src_venv"
alias ex="source src_example"
alias ap="source src_add_path"
alias info="pinfo "
alias bat="bat "
alias img="nsxiv "
alias xclip="xclip -selection clipboard"
alias d="diff --color -u "
alias rgf="rg --files | rg "
alias 7z="7zz" # for whatever reason 7z provides 7zz binary in debian
alias wt="watch --color -d -cn 0.1 "
alias .e="set -a && source .env && set +a"
alias vimu="vim -u /dev/null"
alias reswap="sudo bash -c 'echo Working...; swapoff /swapfile && sudo swapon /swapfile'"
alias make="make -j$(nproc)"
alias py="python3"
alias neofetch="fastfetch"
alias open="xdg-open"

# function aliases
bl()     { brightnessctl set "$1"% > /dev/null; }
nosw()   { alacritty --class 'noswallow' -e "$@"; }; compdef _command nosw
t()      { taskell "${1:-${HOME}/.taskell.md}"; }
vims()   { filepath="$(type "$1" | rev | cut -d ' ' -f 1 | rev)"; [ $? -eq 0 ] && vim "${filepath}"; }; compdef _command vims
tl()     { tree -C "$@" | bat }; compdef _tree tl

# compdef
compdef -a '_git; _git-commit' gdc # todo
compdef '_files -g "*.md"' md

# git aliases
gl() { git log --decorate "$@" | bat }; compdef '_git; _git-log' gl
gus() { git branch --set-upstream-to="${1:?}/${2:?}" "${2:?}"}; compdef '_git; _git-push' gus
gpo() { git push --set-upstream origin ${1:-$(git rev-parse --abbrev-ref HEAD)}}
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit --allow-empty-message --amend --no-edit"
alias gck="git checkout"
alias gcl="git clone"
alias gcls="git clone --depth=1"
alias gcm="git commit --allow-empty-message -m ''"
alias gcn="git clean"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gds="gd --staged"
alias gf="git fetch"
alias gi="git init"
alias gla="gl --all"
alias gm="git merge"
alias gp="git push"
alias gpu="git pull"
alias gr="git restore"
alias grj="git rebase"
alias grjc="git rebase --continue"
alias grjs="git rebase --cancel"
alias grm="git remote"
alias grs="git restore --staged"
alias grt="git reset"
alias gs="git status"
alias gsc="git switch -c"
alias gsh="git show"
alias gsj="git stash"
alias gsp="git stash pop"
alias gt="git tag"
alias gus="git fetch --unshallow"

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

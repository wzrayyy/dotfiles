# keybinds
source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
#     [[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
#     [[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$HOME/.cache/zsh_history"
setopt inc_append_history
setopt extended_history
setopt hist_find_no_dups

# enable alt+arrow movements
bindkey "^[[1;3D" forward-word
bindkey "^[[1;3C" backward-word

# change word-style
autoload -U select-word-style
select-word-style b

# misc
setopt extendedglob
bindkey -e

# completions
zstyle :compinstall filename '/home/wzray/.zshrc'
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

# prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
RPROMPT='$(gitprompt)'

# ls aliases
alias ls="lsd --color=auto"
alias la="ls -lah"
alias ll="ls -lh"
alias tree="ls --tree"

# aliases
alias dt="git --git-dir=$HOME/.dotfiles/git --work-tree=$HOME"
alias rz="exec zsh"
alias bat="batcat"
alias ..="cd .."


# theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[red]%}]"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_UPSTREAM_NO_TRACKING="%{$fg_bold[red]%}!"
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}*"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}+"
ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}s"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}v"

# plugins
source "$HOME/.local/share/zsh-plugins/git-prompt.zsh/git-prompt.zsh"
# source "$HOME/.local/share/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # don't like it, makes my terminal feel sluggish

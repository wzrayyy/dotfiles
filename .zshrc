# history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$HOME/.cache/zsh_history"
setopt inc_append_history
setopt extended_history
setopt hist_find_no_dups

# change word-style
autoload -U select-word-style
select-word-style b

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
RPROMPT='$(gitprompt)'

# ls aliases
alias ls="lsd --color=auto"
alias la="ls -lAh"
alias ll="ls -lh"

# aliases
alias dt="git --git-dir=$HOME/.dotfiles/git --work-tree=$HOME"
alias rz="exec zsh"
alias bat="batcat"

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

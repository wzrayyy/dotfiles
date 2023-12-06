# unused for now
export PATH="${$(find ~/.local/bin -type d -printf %p:)%%:}:$PATH"

# default apps
export EDITOR="/usr/bin/nvim"
export GPG_TTY=$(tty)
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

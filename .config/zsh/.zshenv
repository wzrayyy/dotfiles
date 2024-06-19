set -a

export PATH="${$(find ~/.local/bin -type d -printf %p:)%%:}:$PATH"
#
# lc vars
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# default apps
export EDITOR="/usr/bin/nvim"
export GPG_TTY="$(tty)"
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"
export MTR_OPTIONS="-t"

export XDG_CURRENT_DESKTOP="gtk"
export XDG_SESSION_DESKTOP="$XDG_CURRENT_DESKTOP"
export WINDOW_MANAGER="dwm"

export SUDO_ASKPASS="${HOME}/.local/bin/scripts/dmenu_askpass"

set +a

set -a

PATH="$HOME/.local/share/go/bin:$PATH"
PATH="${$(find -L ~/.local/bin -type d -printf %p:)%%:}:$PATH"

# lc vars
LANGUAGE="en_US.UTF-8"
LANG="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

# default apps
EDITOR="/usr/bin/nvim"
GPG_TTY="$(tty)"
MANPAGER="sh -c 'col -bx | batcat -l man -p'"
MANROFFOPT="-c"
MTR_OPTIONS="-t"
MOZ_USE_XINPUT2=1

XDG_CURRENT_DESKTOP="gtk"
XDG_SESSION_DESKTOP="$XDG_CURRENT_DESKTOP"
WINDOW_MANAGER="dwm"

SUDO_ASKPASS="${HOME}/.local/bin/scripts/dmenu_askpass"
SSH_ASKPASS="${HOME}/.local/bin/scripts/ssh-askpass"

set +a

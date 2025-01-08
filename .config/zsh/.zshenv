set -a

PATH="$HOME/.local/share/go/bin:$PATH"
PATH="${$(find -L ~/.local/bin ! -name '.*' -type d -printf %p:)%%:}:$PATH"

# lc vars
LANG="en_US.UTF-8"
LANGUAGE="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_TIME="en_US.UTF-8"

# xdg dirs
XDG_DATA_HOME="${HOME}/.local/share"
XDG_CONFIG_HOME="${HOME}/.config"
XDG_STATE_HOME="${HOME}/.local/state"
XDG_CACHE_HOME="${HOME}/.cache"
XDG_DESKTOP_DIR="$HOME/"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/"
XDG_PUBLICSHARE_DIR="$HOME/"
XDG_DOCUMENTS_DIR="$HOME/"
XDG_MUSIC_DIR="$HOME/"
XDG_PICTURES_DIR="$HOME/"
XDG_VIDEOS_DIR="$HOME/"

# default configs
ANDROID_HOME="${HOME}/.local/share/android"
ANDROID_USER_HOME="${HOME}/.local/share/android-home"
BAT_THEME="TwoDark"
EDITOR="/usr/bin/nvim"
GNUPGHOME='~/.local/share/gnupg'
GOPATH="${HOME}/.local/share/go"
GPG_TTY="$(tty)"
JAVA_HOME="/usr/lib/jvm/java-23-openjdk"
LESS="--wheel-lines 3 --mouse"
MANPAGER="sh -c 'col -bx | bat -l man -p'"
MANROFFOPT="-c"
MTR_OPTIONS="-t"
SSH_ASKPASS="${HOME}/.local/bin/scripts/pinentry-askpass"
SUDO_ASKPASS="${HOME}/.local/bin/scripts/dmenu-askpass"
GRADLE_USER_HOME="${HOME}/.local/share/gradle"

set +a

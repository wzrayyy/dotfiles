. "${HOME}"/.config/X11/xprofile
[ -z "$DBUS_SESSION_BUS_ADDRESS" ] && eval "$(/usr/bin/dbus-launch --exit-with-session --sh-syntax)"
dbus-update-activation-environment --verbose --all
xr
. "${HOME}"/.config/X11/autostart

gpg-agent -d

export XDG_CURRENT_DESKTOP="gtk"
export XDG_SESSION_DESKTOP="$XDG_CURRENT_DESKTOP"
export WINDOW_MANAGER="dwm"

exec ssh-agent "${HOME}"/.local/src/dwm/dwm
# exec ssh-agent /usr/bin/dwm

# vim: ft=sh

. "${HOME}"/.config/X11/xprofile

# dbus
[ -z "$DBUS_SESSION_BUS_ADDRESS" ] && eval "$(/usr/bin/dbus-launch --exit-with-session --sh-syntax)"
dbus-update-activation-environment --verbose --all

# env
systemctl --user import-environment XDG_CURRENT_DESKTOP
systemctl --user import-environment DISPLAY

# agents
gpg-agent -d
eval "$(ssh-agent)"

# resolution and autostart
"${HOME}"/.config/X11/runonce
xr

# dwm
exec "${HOME}"/.local/src/dwm/dwm

# vim: ft=sh

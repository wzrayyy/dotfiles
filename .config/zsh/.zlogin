[ -f "$HOME/.config/.fix-tty" ] || return

process_id="$$"
(
    if [ "$(inxi -aG | grep -c 'Monitor')" = "1" ]; then
        setfont ter-v32n
        stty -F /proc/$process_id/fd/0 rows 65 cols 195
    else
        setfont ter-v16n
        stty -F /proc/$process_id/fd/0 rows 90 cols 320
    fi >/dev/null 2>&1 &
)
unset process_id

# vim: ft=sh

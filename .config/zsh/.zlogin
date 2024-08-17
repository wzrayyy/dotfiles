process_id="$$"
(
    if [ "$(inxi -aG | grep -c 'Monitor')" -eq 1 ]; then
        setfont Uni3-Terminus32x16.psf.gz
        stty -F /proc/$process_id/fd/0 rows 65 cols 195
    else
        setfont Uni3-Terminus16.psf.gz
        stty -F /proc/$process_id/fd/0 rows 90 cols 320
    fi >/dev/null 2>&1 &
)
unset process_id

# vim: ft=sh

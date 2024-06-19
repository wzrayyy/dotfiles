# if [ -z "$SSH_AUTH_SOCK" ]; then
# 	eval "$(ssh-agent -s)"
# fi
systemctl --user import-environment XDG_CURRENT_DESKTOP

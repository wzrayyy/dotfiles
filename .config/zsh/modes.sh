mode::enable() {
    local mode_path="${HOME}/.config/zsh/modes/$1.sh"
    [ ! -f "$mode_path" ] && echo "Mode not found!" && return 1
    export MODE__ACTIVE_MODE="$1"

    export MODE__OLD_PS1="$PS1"
    export PS1="($1) $PS1"

    # shellcheck disable=SC1090
    source "$mode_path"
}


mode::disable() {
    export PS1="${MODE__OLD_PS1}"
    local mode_path="${HOME}/.config/zsh/modes/$MODE__ACTIVE_MODE.sh"

    unset -v "MODE__OLD_PS1"
    unset -v "MODE__ACTIVE_MODE"

    for mode_variable in $(perl -ne '/^(?>declare\s+(?>--?\w+\s*)+\s*)?\s*([\x21-\x3c\x3e-\x7e]+)=.*$/ && print "$1\n"' < "$mode_path"); do
        unset "$mode_variable"
    done

    for mode_function in $(perl -ne '/^(?>function\s+)?([\x21-\x7e]+)\s*\(\)/ && print "$1\n"' < "$mode_path"); do
        unset -f "$mode_function"
    done

    for mode_alias in $(perl -ne '/^alias ([\x21-\x3c\x3e-\x7e]+)=/ && print "$1\n"'< "$mode_path"); do
        unalias "$mode_alias"
    done
}


mode::help() {
    echo "USAGE"
    echo "    mode [-h]"
    echo "    mode <MODENAME>"
    echo "    mode"
    echo
    echo "OPTIONS"
    echo "    -h for help lol"
    echo
    echo "AVAILABLE MODES"
    for mode in ~/.config/zsh/modes/*; do
        printf "    %s\n" "$(basename "${mode%.sh}")"
    done
}

m() {
    [ -n "$MODE__ACTIVE_MODE" ] && mode::disable && return
    local cmd="${1:?}"

    case "$cmd" in
        "-h"|"--help")
            mode::help
            ;;
        *)
            mode::enable "$cmd" || mode::help >&2
            ;;
    esac
}

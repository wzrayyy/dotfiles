# shellcheck disable=SC2139

CPP_MODE__BUILD_DIR="./cmake-build"

alias cb="cmake --build ${CPP_MODE__BUILD_DIR}"
alias cg="cmake -B ${CPP_MODE__BUILD_DIR} -DCMAKE_EXPORT_COMPILE_COMMANDS=1 && ln -sf ${CPP_MODE__BUILD_DIR}/compile_commands.json ."

cpp_mode::find_exec() {
    find "${CPP_MODE__BUILD_DIR}/$1" -maxdepth 1 -type f -executable
}

ct() {
    eval "$(cpp_mode::find_exec "tests")"
}

cr() {
    eval "$(cpp_mode::find_exec)"
}

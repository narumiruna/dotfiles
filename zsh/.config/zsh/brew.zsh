is_macos() {
  [[ "$(uname -s)" == "Darwin" ]]
}

prepend_path_if_exists() {
  local dir="$1"
  [[ -d "$dir" ]] && export PATH="$dir:$PATH"
}

if is_macos; then
  local brew_bin="/opt/homebrew/bin/brew"

  [[ -x "$brew_bin" ]] || return 0
  eval "$("$brew_bin" shellenv)"

  prepend_path_if_exists "/opt/homebrew/opt/mysql-client/bin"
  prepend_path_if_exists "/opt/homebrew/opt/openjdk/bin"
fi

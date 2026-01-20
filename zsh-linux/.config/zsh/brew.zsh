if [[ "$(uname -s)" == "Darwin" ]]; then
  brew_bin="/opt/homebrew/bin/brew"

  [[ -x "$brew_bin" ]] || return 0
  eval "$("$brew_bin" shellenv)"
fi

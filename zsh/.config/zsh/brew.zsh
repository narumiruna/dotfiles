if [[ "$(uname -s)" == "Darwin" ]]; then
  brew_bin="/opt/homebrew/bin/brew"

  [[ -x "$brew_bin" ]] || return 0
  eval "$("$brew_bin" shellenv)"

  [[ -d "/opt/homebrew/opt/mysql-client/bin" ]] && export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
  [[ -d "/opt/homebrew/opt/openjdk/bin" ]] && export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi

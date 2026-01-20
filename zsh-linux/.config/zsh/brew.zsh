is_macos() {
  [[ "$(uname -s)" == "Darwin" ]]
}

setup_homebrew() {
  local brew_bin="/opt/homebrew/bin/brew"

  [[ -x "$brew_bin" ]] || return 0
  eval "$("$brew_bin" shellenv)"
}

if is_macos; then
    setup_homebrew

    # reset launchpad
    defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock

    # .DS_Store
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
fi

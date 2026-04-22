# Justfile for dotfiles management using GNU Stow

stow_flags := "--adopt --restow -v"
target := env('HOME')
dotfiles := "atuin zsh starship fish tmux codex opencode"

# Install all dotfiles
[default]
install:
    just {{ dotfiles }}
    if [ "{{ os() }}" = "macos" ]; then \
      just ghostty; \
    fi

# Uninstall all dotfiles
clean:
    stow -D -t {{ target }} {{ dotfiles }} 2>/dev/null || true
    stow -D -t {{ target }} ghostty 2>/dev/null || true

# Reinstall all dotfiles
reinstall:
    just clean
    just install

# Install required dependencies
install-deps:
    if command -v bat >/dev/null 2>&1; then echo "skip bat"; else cargo install --locked bat; fi
    if command -v fd >/dev/null 2>&1; then echo "skip fd-find"; else cargo install --locked fd-find; fi
    if command -v fnm >/dev/null 2>&1; then echo "skip fnm"; else cargo install --locked fnm; fi
    if command -v lsd >/dev/null 2>&1; then echo "skip lsd"; else cargo install --locked lsd; fi
    if command -v ouch >/dev/null 2>&1; then echo "skip ouch"; else cargo install --locked ouch; fi
    if command -v rg >/dev/null 2>&1; then echo "skip ripgrep"; else cargo install --locked ripgrep; fi
    if command -v sk >/dev/null 2>&1; then echo "skip skim"; else cargo install --locked skim --no-default-features --features cli; fi
    if command -v zoxide >/dev/null 2>&1; then echo "skip zoxide"; else cargo install --locked zoxide; fi
    if command -v zellij >/dev/null 2>&1; then echo "skip zellij"; else cargo install --locked zellij; fi
    if command -v atuin >/dev/null 2>&1; then echo "skip atuin"; else curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh; fi
    if command -v uv >/dev/null 2>&1; then echo "skip uv"; else curl -LsSf https://astral.sh/uv/install.sh | sh; fi
    if command -v starship >/dev/null 2>&1; then echo "skip starship"; else curl -sS https://starship.rs/install.sh | sh; fi
    if [ -d "$HOME/.pyenv" ]; then echo "skip pyenv"; else git clone https://github.com/pyenv/pyenv.git "$HOME/.pyenv"; fi

# Install Atuin shell history config
[group('config')]
atuin:
    stow {{ stow_flags }} -t {{ target }} atuin

# Install Fish shell config
[group('config')]
fish:
    stow {{ stow_flags }} -t {{ target }} fish

# Install Starship prompt
[group('config')]
starship:
    stow {{ stow_flags }} -t {{ target }} starship

# Install Tmux config
[group('config')]
tmux:
    stow {{ stow_flags }} -t {{ target }} tmux

# Install Zsh config
[group('config')]
zsh:
    stow {{ stow_flags }} -t {{ target }} zsh

# Install Ghostty terminal config
[group('config')]
ghostty:
    stow {{ stow_flags }} -t {{ target }} ghostty

# Install Codex config
[group('config')]
codex:
    stow {{ stow_flags }} -t {{ target }} codex

# Install OpenCode config
[group('config')]
opencode:
    stow {{ stow_flags }} -t {{ target }} opencode

# Reset launchpad on macOS
[group('macos')]
reset-launchpad:
    if [ "{{ os() }}" = "macos" ]; then \
        defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock; \
    fi

# Disable .DS_Store file creation on network and USB drives on macOS
[group('macos')]
disable-dsstore:
    if [ "{{ os() }}" = "macos" ]; then \
        defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true; \
        defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true; \
    fi

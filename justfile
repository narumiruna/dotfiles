# Justfile for dotfiles management using GNU Stow

stow_flags := "--restow -v"
target := env('HOME')
dotfiles := "atuin zsh starship fish tmux"

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

# Install required dependencies
install-deps:
    cargo install --locked bat
    cargo install --locked fd-find
    cargo install --locked fnm
    cargo install --locked lsd
    cargo install --locked ouch
    cargo install --locked ripgrep
    cargo install --locked skim --no-default-features --features cli
    cargo install --locked zoxide
    curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
    curl -LsSf https://astral.sh/uv/install.sh | sh
    curl -sS https://starship.rs/install.sh | sh
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

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

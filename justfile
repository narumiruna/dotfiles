# Justfile for dotfiles management using GNU Stow

stow_flags := "--restow -v"
target := env('HOME')
linux-dotfiles := "zsh starship fish tmux"
macos-dotfiles := "macos-defaults ghostty"

# Install core packages (default)
all:
    just {{ linux-dotfiles }}
    if [ "{{ os() }}" = "macos" ]; then \
      just {{ macos-dotfiles }}; \
    fi

# Install Fish shell config
fish:
    stow {{ stow_flags }} -t {{ target }} fish

# Install Ghostty terminal config
ghostty:
    stow {{ stow_flags }} -t {{ target }} ghostty

# Install macOS defaults
macos-defaults:
    macos-defaults/macos-defaults.sh

# Install Starship prompt
starship:
    stow {{ stow_flags }} -t {{ target }} starship

# Install Tmux config
tmux:
    stow {{ stow_flags }} -t {{ target }} tmux

# Install Zsh config
zsh:
    stow {{ stow_flags }} -t {{ target }} zsh

# Remove all symlinks
clean:
    stow -D -t {{ target }} {{ linux-dotfiles }} 2>/dev/null || true
    stow -D -t {{ target }} {{ macos-dotfiles }} 2>/dev/null || true

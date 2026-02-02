# Justfile for dotfiles management using GNU Stow

stow_flags := "--restow -v"
target := env('HOME')
dotfiles := "zsh starship fish tmux"

# Install core packages
default:
    just {{ default-dotfiles }}
    if [ "{{ os() }}" = "macos" ]; then \
      just macos-defaults ghostty; \
    fi

# Install Fish shell config
fish:
    stow {{ stow_flags }} -t {{ target }} fish

# Install Starship prompt
starship:
    stow {{ stow_flags }} -t {{ target }} starship

# Install Tmux config
tmux:
    stow {{ stow_flags }} -t {{ target }} tmux

# Install Zsh config
zsh:
    stow {{ stow_flags }} -t {{ target }} zsh

# Install Ghostty terminal config
ghostty:
    stow {{ stow_flags }} -t {{ target }} ghostty

# Install macOS defaults
macos-defaults:
    sh macos-defaults/macos-defaults.sh

# Remove all symlinks
clean:
    stow -D -t {{ target }} {{ default-dotfiles }} 2>/dev/null || true
    stow -D -t {{ target }} ghostty 2>/dev/null || true

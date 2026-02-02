# Justfile for dotfiles management using GNU Stow

stow := "stow"
stow_flags := "--restow -v"
target := "~"

# Install core packages (default)
all:
  @just zsh starship fish tmux
  @if [ "{{os()}}" = "macos" ]; then \
    just macos-defaults ghostty; \
  fi
  @echo "✓ All packages installed"

# Install Fish shell config
fish:
  @{{stow}} {{stow_flags}} -t {{target}} fish

# Install Ghostty terminal config
ghostty:
  @{{stow}} {{stow_flags}} -t {{target}} ghostty

# Install macOS defaults
macos-defaults:
  @macos-defaults/macos-defaults.sh

# Install Starship prompt
starship:
  @{{stow}} {{stow_flags}} -t {{target}} starship

# Install Tmux config
tmux:
  @{{stow}} {{stow_flags}} -t {{target}} tmux

# Install Zsh config
zsh:
  @{{stow}} {{stow_flags}} -t {{target}} zsh

# Remove all symlinks
clean:
  @echo "Removing symlinks..."
  @{{stow}} -D -t {{target}} zsh starship fish tmux 2>/dev/null || true
  @{{stow}} -D -t {{target}} ghostty 2>/dev/null || true
  @echo "✓ Cleanup complete"

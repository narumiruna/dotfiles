# Justfile for dotfiles management using GNU Stow

stow_flags := "--restow -v"
target := env('HOME')
dotfiles := "atuin zsh starship fish tmux"

# Install all dotfiles
[default]
stow-all:
    just {{ dotfiles }}
    if [ "{{ os() }}" = "macos" ]; then \
      just macos-defaults ghostty; \
    fi

# Uninstall all dotfiles
stow-delete:
    stow -D -t {{ target }} {{ dotfiles }} 2>/dev/null || true
    stow -D -t {{ target }} ghostty 2>/dev/null || true

# Install required Cargo packages
cargo:
    # cargo install --locked uv
    cargo install --locked atuin
    cargo install --locked bat
    cargo install --locked fd-find
    cargo install --locked fnm
    cargo install --locked lsd
    cargo install --locked ouch
    cargo install --locked ripgrep
    cargo install --locked skim --no-default-features --features cli
    cargo install --locked starship
    cargo install --locked zoxide

# Install required Git repositories
git:
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

# Reset launchpad and .DS_Store settings on macOS
macos-defaults:
    sh macos-defaults/macos-defaults.sh

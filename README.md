# dotfiles

## Prerequisites

```shell
# Linux (Debian/Ubuntu)
sudo apt update
sudo apt install -y stow

# macOS (using Homebrew)
brew install stow

# justfile
cargo install --locked just
```

## Usage

```shell
# List all available recipes
just -l

# Install all dotfiles
just

# Uninstall all dotfiles
just clean
```

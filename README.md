# dotfiles

## Prerequisites

```shell
# Linux (Debian/Ubuntu)
sudo apt update
sudo apt install -y stow

# macOS (using Homebrew)
brew install stow
```

## Usage

```shell
# Install common dotfiles (works on both Linux and macOS)
make

# Or explicitly:
make all

# Install common dotfiles + macOS-specific configs
make macos

# See all available options
make help
```

# dotfiles

## Prerequisites

```shell
# Linux (Debian/Ubuntu)
sudo apt update
sudo apt install -y stow

# macOS (using Homebrew)
brew install stow

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# justfile
cargo install --locked just
```

`just install-deps` is safe to run repeatedly; already installed dependencies are skipped automatically.

## Usage

```shell
# List all available recipes
just -l

# Install all dotfiles
just

# Uninstall all dotfiles
just clean
```

## macOS: Set fish as Default Shell

If you want to set fish as your default shell on macOS via `chsh -s`,
append `/opt/homebrew/bin/fish` to `/etc/shells` first:

```shell
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

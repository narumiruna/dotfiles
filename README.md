# dotfiles

## Prerequisites

### macOS (Recommended Bootstrap)

On a fresh macOS machine, run bootstrap first:

```shell
./scripts/bootstrap-macos.sh
```

This script requires Homebrew to already be installed. It installs/verifies `stow`, Rust (`cargo`), and `just`, then runs `just install-deps`.

### Manual Fallback

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

# Install project dependencies
just install-deps
```

`just install-deps` is safe to run repeatedly; already installed dependencies are skipped automatically.

## Usage

```shell
# List all available recipes
just -l

# Install the default dotfile set
just

# Reinstall all default dotfiles
just reinstall

# Uninstall the default dotfile set
just clean

# Install one module
just zsh
just fish
just pi
```

The default install set is `atuin`, `zsh`, `starship`, `fish`, `tmux`, `codex`, `opencode`, and `claude`.
On macOS, `ghostty` is installed in addition to the default set. The `pi` module is opt-in via `just pi`.

## macOS: Set fish as Default Shell

If you want to set fish as your default shell on macOS via `chsh -s`,
append `/opt/homebrew/bin/fish` to `/etc/shells` first:

```shell
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

# Dotfiles for macOS and Linux ⚙️

Personal **dotfiles** managed with **GNU Stow** and **just** for a fast, reproducible terminal setup on macOS and Linux. This repository configures Fish, Zsh, Starship, Tmux, Atuin, Ghostty, and AI coding agents such as Codex, Claude, and Pi.

## ✨ Features

- 🧩 **Modular dotfiles** with GNU Stow packages for each tool.
- 🚀 **One-command install** through `just` recipes.
- 🍎 **macOS bootstrap** script for fresh machines.
- 🐧 **Linux-friendly setup** with manual dependency instructions.
- 🐟 **Fish and Zsh shell configs** with shared CLI tooling.
- ⭐ **Starship prompt**, **Tmux**, **Atuin shell history**, and **Ghostty terminal** configs.
- 🤖 **AI agent configuration** copied or merged safely to preserve local-only settings.

## 📦 Included Modules

| Module | Purpose | Install behavior |
| --- | --- | --- |
| `atuin` | Shell history sync/search config | GNU Stow |
| `fish` | Fish shell config | GNU Stow |
| `zsh` | Zsh config and aliases | GNU Stow |
| `starship` | Cross-shell prompt config | GNU Stow |
| `tmux` | Terminal multiplexer config | GNU Stow |
| `ghostty` | Ghostty terminal config | GNU Stow; installed by default on macOS |
| `codex` | Codex CLI instructions and config | Copy/merge via `just install` |
| `claude` | Claude settings | Merge via `just install` |
| `pi` | Pi coding agent instructions and settings | Copy/merge via `just install` |

## ✅ Prerequisites

- Git
- GNU Stow
- Rust/Cargo
- `just`
- Homebrew on macOS, if using the bootstrap script

## 🚀 Quick Start

Clone the repository, then run the default installer:

```shell
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
just
```

The default install links `atuin`, `zsh`, `starship`, `fish`, and `tmux`; it also copies or merges agent configs for Codex, Claude, and Pi. On macOS, `ghostty` is installed automatically too.

## 🍎 macOS Bootstrap

On a fresh macOS machine, install Homebrew first, then run:

```shell
./scripts/bootstrap-macos.sh
```

The bootstrap script installs or verifies `stow`, Rust/Cargo, and `just`, then runs `just install-deps`.

## 🛠️ Manual Setup

Use this path if you do not want to run the macOS bootstrap script.

```shell
# Linux (Debian/Ubuntu)
sudo apt update
sudo apt install -y stow

# macOS (Homebrew)
brew install stow

# Install Rust/Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install just
cargo install --locked just

# Install CLI dependencies used by these dotfiles
just install-deps
```

`just install-deps` is safe to run repeatedly; existing tools are skipped automatically.

## 🧑‍💻 Usage

```shell
# List every available recipe
just -l

# Install the default dotfile set
just

# Reinstall everything managed by the default installer
just reinstall

# Uninstall the default dotfile set and copied instruction files
just clean

# Install one stow module
just zsh
just fish
just tmux
just ghostty
```

## 🤖 AI Agent Config Notes

Agent configuration is intentionally **not symlinked**. During `just install`, instruction files are copied and JSON/TOML settings are merged so local-only keys remain in `$HOME` while repository defaults win on matching keys.

This applies to:

- Codex: `~/.codex`
- Claude: `~/.claude`
- Pi: `~/.pi/agent`

## 🐟 Set Fish as the Default Shell on macOS

If Fish was installed with Homebrew, add it to `/etc/shells` before changing your login shell:

```shell
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

## 🧹 Development and Validation

Before committing changes, run the repository quality hooks:

```shell
prek run -a
# fallback:
pre-commit run -a
```

## 📄 License

See [LICENSE](LICENSE).

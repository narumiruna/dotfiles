# Justfile for dotfiles management using GNU Stow

stow_flags := "--adopt --restow -v"
target := env('HOME')
export PATH := target + "/.cargo/bin:" + env('PATH')
dotfiles := "atuin zsh starship fish tmux"
# Agent configs are installed by copy/merge so local edits are not symlinked.
# Keep this list for unstowing older installations that used GNU Stow.
removed_dotfiles := "codex claude pi"

# Install all dotfiles
[default]
install:
    just {{ dotfiles }}
    just _install-agent-configs
    if [ "{{ os() }}" = "macos" ]; then \
      just ghostty; \
    fi

# Uninstall all dotfiles
clean:
    stow -D -t {{ target }} {{ dotfiles }} 2>/dev/null || true
    stow -D -t {{ target }} {{ removed_dotfiles }} 2>/dev/null || true
    just _clean-agent-configs
    stow -D -t {{ target }} ghostty 2>/dev/null || true

# Reinstall all dotfiles
reinstall:
    just clean
    just install

# Install AI agent configs without symlinks.
# Instruction files are copied from the repo; JSON/TOML configs are merged so
# local-only keys stay in place while repo defaults win on matching keys.
_install-agent-configs:
    stow -D -t {{ target }} {{ removed_dotfiles }} 2>/dev/null || true
    mkdir -p "{{ target }}/.codex" "{{ target }}/.claude" "{{ target }}/.pi/agent"
    rm -f "{{ target }}/.codex/AGENTS.md" "{{ target }}/.pi/agent/AGENTS.md"
    cp -f codex/.codex/AGENTS.md "{{ target }}/.codex/AGENTS.md"
    python3 scripts/merge_toml.py codex/.codex/config.toml "{{ target }}/.codex/config.toml"
    python3 scripts/merge_json.py claude/.claude/settings.json "{{ target }}/.claude/settings.json"
    cp -f pi/.pi/agent/AGENTS.md "{{ target }}/.pi/agent/AGENTS.md"
    python3 scripts/merge_json.py pi/.pi/agent/settings.json "{{ target }}/.pi/agent/settings.json"

# Remove copied instruction files only.
# Merged JSON/TOML configs are intentionally preserved to avoid deleting local edits.
_clean-agent-configs:
    rm -f "{{ target }}/.codex/AGENTS.md" "{{ target }}/.pi/agent/AGENTS.md"

# Install required dependencies
install-deps:
    if command -v cargo >/dev/null 2>&1; then echo "skip rust"; else curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal; fi
    if command -v bat >/dev/null 2>&1; then echo "skip bat"; else cargo install --locked bat; fi
    if command -v fd >/dev/null 2>&1; then echo "skip fd-find"; else cargo install --locked fd-find; fi
    if command -v fnm >/dev/null 2>&1; then echo "skip fnm"; else cargo install --locked fnm; fi
    if command -v lsd >/dev/null 2>&1; then echo "skip lsd"; else cargo install --locked lsd; fi
    if command -v ouch >/dev/null 2>&1; then echo "skip ouch"; else cargo install --locked ouch; fi
    if command -v rg >/dev/null 2>&1; then echo "skip ripgrep"; else cargo install --locked ripgrep; fi
    if command -v sk >/dev/null 2>&1; then echo "skip skim"; else cargo install --locked skim --no-default-features --features cli; fi
    if command -v zoxide >/dev/null 2>&1; then echo "skip zoxide"; else cargo install --locked zoxide; fi
    if command -v zellij >/dev/null 2>&1; then echo "skip zellij"; else cargo install --locked zellij; fi
    if command -v atuin >/dev/null 2>&1; then echo "skip atuin"; else curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh; fi
    if command -v uv >/dev/null 2>&1; then echo "skip uv"; else curl -LsSf https://astral.sh/uv/install.sh | sh; fi
    if command -v starship >/dev/null 2>&1; then echo "skip starship"; else curl -sS https://starship.rs/install.sh | sh -s -- --yes; fi
    if [ -d "$HOME/.pyenv" ]; then echo "skip pyenv"; else git clone https://github.com/pyenv/pyenv.git "$HOME/.pyenv"; fi

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

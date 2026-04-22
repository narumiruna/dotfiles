#!/usr/bin/env bash

set -euo pipefail

log() {
  printf '[bootstrap] %s\n' "$1"
}

abort() {
  printf '[bootstrap] %s\n' "$1" >&2
  exit 1
}

if [[ "$(uname -s)" != "Darwin" ]]; then
  abort "This script only supports macOS (Darwin)."
fi

if ! command -v brew >/dev/null 2>&1; then
  abort "Homebrew is required. Install it first from: https://brew.sh"
fi

if command -v stow >/dev/null 2>&1; then
  log "stow already installed, skipping."
else
  log "Installing stow via Homebrew..."
  brew install stow
fi

if command -v cargo >/dev/null 2>&1; then
  log "cargo already installed, skipping Rust install."
else
  log "Installing Rust toolchain via rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

if [[ -f "$HOME/.cargo/env" ]]; then
  # shellcheck disable=SC1090
  source "$HOME/.cargo/env"
fi

if command -v just >/dev/null 2>&1; then
  log "just already installed, skipping."
else
  log "Installing just via cargo..."
  cargo install --locked just
fi

log "Running just install-deps..."
just install-deps

log "Bootstrap complete."

#!/usr/bin/env bash
# Smoke-test a fresh Ubuntu install in a disposable Docker container.
# Requires Docker on the host; does not modify the host HOME.
set -euo pipefail

image="${UBUNTU_IMAGE:-ubuntu:24.04}"
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v docker >/dev/null 2>&1; then
  echo "docker is required to run this test" >&2
  exit 127
fi

container_script='set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install --no-install-recommends -y ca-certificates curl python3 stow
curl --proto "=https" --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin
just --version

just install

# GNU Stow-managed files should be symlinks.
test -L "$HOME/.zshrc"
test -L "$HOME/.tmux.conf"
test -L "$HOME/.config/starship.toml"
test -L "$HOME/.config/atuin"
test -L "$HOME/.config/fish"

# Agent instruction files are copied, not symlinked.
test -f "$HOME/.codex/AGENTS.md"
test ! -L "$HOME/.codex/AGENTS.md"
test -f "$HOME/.config/opencode/AGENTS.md"
test ! -L "$HOME/.config/opencode/AGENTS.md"
test -f "$HOME/.pi/agent/AGENTS.md"
test ! -L "$HOME/.pi/agent/AGENTS.md"

# Agent configs are merged/copied as regular files, not symlinks.
test -f "$HOME/.codex/config.toml"
test ! -L "$HOME/.codex/config.toml"
test -f "$HOME/.claude/settings.json"
test ! -L "$HOME/.claude/settings.json"
test -f "$HOME/.config/opencode/opencode.json"
test ! -L "$HOME/.config/opencode/opencode.json"
test -f "$HOME/.pi/agent/settings.json"
test ! -L "$HOME/.pi/agent/settings.json"

python3 - <<"PY"
import json
import tomllib
from pathlib import Path

home = Path.home()

codex = tomllib.loads((home / ".codex/config.toml").read_text())
assert codex["model"] == "gpt-5.5"
assert codex["features"]["goals"] is True

claude = json.loads((home / ".claude/settings.json").read_text())
assert claude["effortLevel"] == "xhigh"

opencode = json.loads((home / ".config/opencode/opencode.json").read_text())
assert "provider" in opencode
assert "bifrost" in opencode["provider"]

pi = json.loads((home / ".pi/agent/settings.json").read_text())
assert pi["defaultModel"] == "gpt-5.5"
PY

just clean

# clean removes stowed files and copied instruction files.
test ! -e "$HOME/.zshrc"
test ! -e "$HOME/.codex/AGENTS.md"
test ! -e "$HOME/.config/opencode/AGENTS.md"
test ! -e "$HOME/.pi/agent/AGENTS.md"

# clean intentionally preserves merged local config files.
test -f "$HOME/.codex/config.toml"
test -f "$HOME/.claude/settings.json"
test -f "$HOME/.config/opencode/opencode.json"
test -f "$HOME/.pi/agent/settings.json"

echo "Ubuntu install test passed"
'

docker run --rm \
  --mount "type=bind,src=${repo_root},dst=/workspace/dotfiles,readonly" \
  --workdir /workspace/dotfiles \
  "${image}" \
  bash -lc "${container_script}"

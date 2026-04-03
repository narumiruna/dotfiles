# Repository Guidelines

## Project Structure & Module Organization
This repository manages personal dotfiles using GNU Stow and `just`.

- Root-level config folders: `atuin/`, `zsh/`, `fish/`, `starship/`, `tmux/`, `codex/`, `opencode/`, `ghostty/`.
- Automation entrypoints: `justfile`, `.pre-commit-config.yaml`.
- Project docs: `README.md`, `MEMORY.md` (if present for reusable gotchas/preferences).

Each config folder is stowed into `$HOME` (for example, `zsh/.zshrc` or `fish/.config/fish/...`).

## Build, Test, and Development Commands
- `just -l`: list all available recipes.
- `just` or `just install`: stow all default dotfiles into `$HOME`.
- `just clean`: unstow managed dotfiles.
- `just reinstall`: clean then install.
- `just <module>`: install one module (example: `just zsh`, `just fish`).
- `just install-deps`: install CLI dependencies used by this setup.
- `prek run -a` (fallback `pre-commit run -a`): run all quality hooks; required before finishing config/code changes.

## Coding Style & Naming Conventions
- Use YAML/TOML/JSON formatting enforced by pre-commit hooks.
- Python-related formatting/linting/type checks are enforced through `ruff`, `ty`, and `uv-lock` hooks.
- Keep shell/config changes minimal and explicit; avoid broad refactors in unrelated modules.
- Use clear, descriptive recipe and file names; prefer kebab-case for new recipe names.

## Testing Guidelines
This repo does not use a dedicated unit test suite. Validation is hook-based:

1. Run `prek run -a`.
2. Run targeted dry checks by recipe when relevant (for example `just zsh`).
3. Verify stow/un-stow behavior locally with `just` and `just clean`.

Treat pre-commit failures as blocking.

## Commit & Pull Request Guidelines
- Follow existing commit style from history: Conventional Commit-like prefixes such as `feat:` and `fix:`, with concise imperative summaries.
- Keep commits scoped to one logical change (for example, “fix: adjust fish PATH export”).
- Do not use `git add -A`; stage explicitly by path (`git add justfile fish/.config/fish/config.fish`).
- PRs should include: purpose, affected modules, local validation steps run, and any platform-specific notes (Linux/macOS differences).

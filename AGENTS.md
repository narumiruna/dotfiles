# AGENTS.md

## Purpose
This file is guidance for agentic coding tools working in this repository.
It documents how to build, lint, validate, and edit safely.

## Rule Files Checked
- `.cursorrules`: not present.
- `.cursor/rules/`: not present.
- `.github/copilot-instructions.md`: not present.

## Repository Overview
This is a dotfiles repository managed with GNU Stow and `just`.
Top-level folders are Stow packages symlinked into `$HOME`.

- `atuin/`: Atuin CLI history config.
- `fish/`: Fish shell config, conf snippets, completions, abbreviations.
- `zsh/`: Zsh config plus modular `~/.config/zsh/*.zsh` fragments.
- `starship/`: Starship prompt TOML config.
- `tmux/`: Tmux config.
- `ghostty/`: Ghostty config (installed conditionally on macOS).
- `justfile`: Main task runner interface for install/cleanup.
- `.pre-commit-config.yaml`: lint/format/type-check hooks.

## Build / Lint / Test Commands

### Core workflow commands
- `just -l` — list all available recipes.
- `just` — install all configured dotfiles via Stow.
- `just clean` — remove installed symlinks for managed packages.
- `just install-deps` — install CLI dependencies used by this setup.

### Per-package install commands
- `just atuin`
- `just fish`
- `just starship`
- `just tmux`
- `just zsh`
- `just ghostty`

### macOS-only utility commands
- `just reset-launchpad`
- `just disable-dsstore`

### Lint/format/type-check commands
Preferred command in this repo:
- `prek run -a`

Portable fallback if `prek` is unavailable:
- `pre-commit run -a`

Run a single hook across all files:
- `pre-commit run ruff --all-files`
- `pre-commit run ruff-format --all-files`
- `pre-commit run ty-check --all-files`
- `pre-commit run tombi-format --all-files`

Run a single hook for one file (closest equivalent to a single test):
- `pre-commit run ruff --files path/to/file`
- `pre-commit run ruff-format --files path/to/file`
- `pre-commit run ty-check --files path/to/file`
- `pre-commit run tombi-format --files path/to/file`

### Test commands
There is no dedicated unit/integration test suite in this repository.
Validation is operational and manual:

- Re-stow the affected package with `just <package>`.
- Open a new shell/session and verify behavior.
- Run `prek run -a` (or `pre-commit run -a`) before finishing.

### “Single test” guidance for agents
Because there are no formal tests, treat these as single-target validations:

- Single package validation: `just fish` (or another package target).
- Single-file lint/format/type check: `pre-commit run <hook> --files <file>`.
- Single behavior check: restart the relevant tool and verify one changed behavior.

## Editing and Style Guidelines

### General
- Keep edits minimal and scoped to the requested change.
- Preserve existing file layout and section ordering when possible.
- Use LF line endings and avoid trailing whitespace.
- Keep files ASCII unless a file already requires Unicode glyphs.
- Do not add boilerplate headers or license blocks.

### Naming conventions
- New shell fragment filenames: lowercase, descriptive, extension by shell.
  - Fish: `.fish` in `fish/.config/fish/conf.d/`.
  - Zsh: `.zsh` in `zsh/.config/zsh/`.
- Keep names short but specific, e.g. `pyenv.zsh`, `bun.fish`.
- For TOML keys, follow upstream tool schema naming.

### Imports / sourcing / load order
In this repository, “imports” are shell `source` statements and init `eval` calls.

- Keep shell bootstrap order deterministic.
- Source environment/setup fragments before dependent commands.
- In Zsh, load aliases and path setup before prompt initialization.
- Keep `starship` and `zoxide` init near the end of shell startup files.

### Formatting
- Match existing indentation per file type.
- Keep blank lines between logical groups.
- Keep command lists grouped by function (git aliases, zellij aliases, etc.).
- Prefer one setting per line for readability.

### Types and static analysis
This repo is mostly shell/TOML, but pre-commit includes Python-oriented checks.

- If adding Python, include explicit type hints for public functions.
- Keep Python compatible with configured lint/type hooks (`ruff`, `ty-check`).
- Avoid introducing dynamically typed shortcuts that defeat static checks.

### Error handling and safety
- Guard OS-specific logic with explicit platform checks.
- Guard command execution on existence checks when appropriate.
  - Example pattern: `[[ -x "$bin" ]] || return 0`.
- Use cleanup-tolerant patterns (`|| true`) only in cleanup/uninstall paths.
- Prefer idempotent commands so repeated runs are safe.

### Shell-specific conventions

#### Fish
- Use `set -gx` for exported globals, `set -l` for locals.
- Prefer `fish_add_path` over manual PATH concatenation when practical.
- Keep `conf.d` snippets focused on one tool/purpose each.

#### Zsh
- Quote variable expansions unless unquoted form is required.
- Prefer small helper functions for reusable checks/path logic.
- Keep PATH edits straightforward and deduplicate when needed.

#### Justfile
- Keep recipe bodies simple and readable.
- Preserve existing variable usage (`stow_flags`, `target`, `dotfiles`).
- Keep macOS behavior conditional via `if [ "{{ os() }}" = "macos" ]; then ... fi`.

#### TOML configs
- Follow tool schema and existing ordering.
- Keep arrays multi-line when long.
- Keep comments concise and only where useful for context.

## Validation Checklist (Before Finishing)
- Run `just <affected-package>` for each changed package.
- Run `prek run -a` (or `pre-commit run -a`).
- If shell startup changed, open a fresh shell and check for startup errors.
- If prompt/history config changed, verify in an interactive shell.
- Confirm no secrets or host-only credentials were introduced.

## Commit and PR Guidance
- Follow lightweight conventional commit style from history.
- Typical format: `fix: <imperative summary>`.
- Keep commits focused and avoid mixing unrelated tool changes.
- In PRs, list user-visible impact and verification commands used.
- Include screenshots only when terminal UI output meaningfully changes.

## Agent Behavior Expectations
- Do not undo unrelated local changes.
- Prefer repository-native commands (`just`, `prek`, `pre-commit`).
- Prefer targeted validation over broad, expensive operations.
- When no automated test exists, clearly report what was validated manually.

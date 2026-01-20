# Repository Guidelines

## Project Structure & Module Organization

This repo is a dotfiles collection organized by tool and platform. Each top-level directory is a stow package that mirrors paths under `~`.

- `fish/`, `zsh-linux/`, `zsh-macos/`: shell configs by shell and OS.
- `git/`, `tmux/`, `starship/`, `ghostty/`: tool-specific configs.
- `skills/`: agent skill definitions for Codex/Claude.
- `Makefile`: entry point for installing via GNU Stow.

## Build, Test, and Development Commands

- `make linux`: stows common packages plus Linux zsh config into `~`.
- `make macos`: stows common packages plus macOS zsh config into `~`.
- `make common`: stows shared packages (`starship`, `fish`, `git`, `tmux`).
- `make <package>` (e.g., `make ghostty`): stows a single package into `~`.
- `make skills`: stows skills into `~/.codex/skills` and `~/.claude/skills`.

## Coding Style & Naming Conventions

- Follow existing file conventions in each directory (indentation, quoting, and ordering).
- Use LF line endings and keep files ASCII unless the file already uses Unicode.
- Match naming patterns: directory names reflect the app (`tmux/`, `git/`), OS-specific variants use `-linux`/`-macos`.

## Testing Guidelines

There are no automated tests. Validate changes by stowing the relevant package and opening the tool to confirm behavior (e.g., launch `tmux` or a shell session).

## Commit & Pull Request Guidelines

- Commit messages in history are short, imperative, and sentence-cased (e.g., "Refactor Fish configuration"). Follow that style without prefixes.
- PRs should describe the target platform (Linux/macOS), the stow package(s) touched, and any manual verification performed. Include before/after snippets for prompt or shell changes when relevant.

## Security & Configuration Tips

Avoid committing secrets or host-specific paths. Prefer environment variables or per-machine overrides in local files that are not tracked.

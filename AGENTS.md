# Repository Guidelines

## Project Structure & Module Organization
This repository contains dotfiles organized by tool and managed with GNU Stow. Each top-level directory maps to a Stow package that is linked into `$HOME`.

- `atuin/`, `fish/`, `starship/`, `tmux/`, `zsh/`: Shell and tool configurations.
- `ghostty/`: Terminal configuration (macOS only, installed conditionally).
- `justfile`: Task runner entrypoint for install and maintenance commands.

## Build, Test, and Development Commands
This repo does not have a build step. Use `just` recipes for common actions.

- `just -l`: List all available recipes.
- `just`: Install all dotfiles via Stow; also installs `ghostty` on macOS.
- `just clean`: Uninstall all dotfiles from `$HOME`.
- `just install-deps`: Install required CLI dependencies (Cargo, curl, git).
- `just atuin`, `just fish`, `just starship`, `just tmux`, `just zsh`: Install a single package.
- `just reset-launchpad`, `just disable-dsstore`: macOS-only system tweaks.

## Coding Style & Naming Conventions
- Follow existing shell and config file formatting; keep indentation consistent with surrounding files.
- Use LF line endings and avoid trailing whitespace.
- Prefer clear, descriptive filenames and keys; keep comments concise and actionable.
- Pre-commit hooks enforce formatting and basic checks; run `prek run -a` before finishing changes.

## Testing Guidelines
There are no automated tests. Validate changes by installing with `just` and confirming the expected behavior in the target shell or tool. For config-only updates, also run `prek run -a` to ensure format and lint checks pass.

## Commit & Pull Request Guidelines
Recent history follows a lightweight conventional style, typically `fix: <summary>` with a short, imperative description. Keep commit messages concise and focused on the change.

For pull requests:
- Describe the user-visible impact and which tools are affected.
- Include reproduction or verification steps (e.g., `just fish` then open a new shell).
- Add screenshots only when the change affects terminal UI output.

## Security & Configuration Tips
- Avoid hard-coding secrets or host-specific values.
- Prefer environment variables and tool defaults when adding new settings.
- Keep macOS-only behaviors guarded behind platform checks in `justfile`.

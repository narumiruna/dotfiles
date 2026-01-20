# Repository Guidelines

## Project Structure & Module Organization
This repo contains dotfiles organized by tool, intended to be symlinked with GNU Stow.
- Top-level packages: `zsh/`, `fish/`, `git/`, `tmux/`, `starship/`, `ghostty/`, `macos-defaults/`
- Each directory mirrors the target path under `$HOME` (e.g., `zsh/.zshrc`, `git/.gitconfig`).
- `skills/` contains Codex/Claude skill bundles with subdirectories for different skill types.

## Build, Test, and Development Commands
All management is via `make` and `stow`.
- `make` or `make all`: symlink `zsh`, `starship`, `fish`, `git`, `tmux` into `~`.
- `make macos-defaults`: symlink macOS-specific defaults into `~`.
- `make ghostty`: symlink Ghostty config into `~`.
- `make skills`: install skills into `~/.codex/skills` and `~/.claude/skills`.
Examples:
- `make zsh` (install only Zsh config)
- `make starship` (install only Starship prompt)
- `make ghostty` (install only Ghostty config)

## Coding Style & Naming Conventions
- Keep files in their tool-specific package directory and mirror the final path.
- Use lowercase directory names matching the tool (`zsh`, `git`, `tmux`).
- Preserve existing formatting in config files; prefer minimal diffs.
- Prefer POSIX shell style in scripts; use tabs for Makefile recipes.

## Testing Guidelines
No automated tests are defined. Validate changes manually by running the relevant `make` target and confirming the tool loads the config without errors (e.g., `zsh -lc 'source ~/.zshrc'`).

## Commit & Pull Request Guidelines
Recent history uses a Conventional Commits style:
- `feat(scope): ...`, `chore: ...`, `refactor: ...`
Use short, imperative subjects and include a scope when it clarifies the target (e.g., `feat(zsh): add plugin`).
For PRs, include:
- A brief summary of changes and the `make` targets affected.
- Screenshots only if UI-facing changes are visible (e.g., terminal prompt).

## Security & Configuration Tips
- Avoid committing secrets or machine-specific tokens.
- When adding paths, prefer environment variables over absolute user paths.

# Global AGENTS.md

## Core

- Keep documents concise, enforceable, and non-duplicative.
- Source files exceeding 1,000 lines must either be decomposed along clear responsibility boundaries or include a documented justification for remaining intact.

## Execution

- Never run commands that open an interactive editor, pager, REPL, TUI, or prompt.
- Always use `uv run python` instead of invoking `python` directly.
- Ask at most one clarifying question per turn, and present options as a numbered list.

## Git & GitHub

- Do not use blanket staging such as `git add -A`; stage only intended paths.
- Never change Git `user.name` or `user.email` unless explicitly requested.
- Always sign commits.
- Do not add `Co-Authored-By` trailers (or any other agent-attribution trailer) to commit messages unless the user explicitly asks for one. This overrides per-project guidelines that default-include such a trailer.

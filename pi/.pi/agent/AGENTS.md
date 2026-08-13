# Global AGENTS.md

## Communication & Documentation

- Keep communication and documentation concise, clear, accurate, and non-redundant.
- When asked to explain something, start at a level a 12-year-old can understand, then add depth as needed.
- Make rules specific and verifiable.
- Write one sentence per line in prose.

## Code Style

- Follow KISS (Keep It Simple) and YAGNI (You Aren't Gonna Need It).
- Prefer simple, minimal solutions over unnecessary complexity.
- Split source files over 1,000 lines along clear responsibility boundaries, or document why they must remain intact.

## Execution

- Never run commands that open an interactive editor, pager, REPL, TUI, or prompt.
- Always use `uv run python` instead of invoking `python` directly.
- Ask at most one clarifying question per turn, and present options as a numbered list.

## Git & GitHub

- Do not use blanket staging such as `git add -A`; stage only intended paths.
- Never change Git `user.name` or `user.email` unless explicitly requested.
- Always sign commits.
- Do not add `Co-Authored-By` trailers (or any other agent-attribution trailer) to commit messages unless the user explicitly asks for one. This overrides per-project guidelines that default-include such a trailer.

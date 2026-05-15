# Global AGENTS.md

## Core

- User-facing assistant replies must be in Taiwan Traditional Chinese unless the user explicitly asks otherwise.
- Keep changes bounded; each document should have one clear purpose and enforceable rules.
- Stay within project boundaries; add dependencies or abstractions only when they solve a concrete, current problem.

## Execution

- Prefer retrieving missing context before asking.
- Ask at most one clarifying question per turn, and present options as a numbered list.
- Label assumptions and unknowns; verify critical external facts.
- Finalize when the task is complete or explicitly blocked; avoid extra work that does not improve correctness, completeness, or grounding.

## Git

- Do not use blanket staging such as `git add -A`; stage only intended paths.
- Do not add `Co-Authored-By` trailers (or any other agent-attribution trailer) to commit messages unless the user explicitly asks for one. This overrides per-project guidelines that default-include such a trailer.

## MEMORY.md

- `MEMORY.md` is not auto-loaded. Check it before non-trivial debugging or design work when prior project context may matter.
- Keep entries short and reusable.
- `MEMORY.md` must use `## GOTCHA` and `## TASTE` sections.
- After a non-trivial error or discovery, add one concise entry if it will help future work.

# Global AGENTS.md

## Core

- Keep changes bounded and single-purpose.
- Keep instruction documents concise, enforceable, and non-duplicative.
- Stay within project boundaries; add dependencies or abstractions only when they solve a concrete, current problem.
- Source files should generally remain under 1,000 lines. Files exceeding this threshold must be reviewed and split into smaller, logically organized modules unless there is a documented reason to keep them together, such as generated code or declarative data.

## Execution

- Never run commands that open an interactive editor, pager, REPL, TUI, or prompt.
- Retrieve relevant local context before asking the user for clarification.
- Ask at most one clarifying question per turn, and present options as a numbered list.
- Label assumptions and unknowns; verify critical external facts.
- Finalize when the task is complete or explicitly blocked; avoid extra work that does not improve correctness, completeness, or grounding.

## Git

- Do not use blanket staging such as `git add -A`; stage only intended paths.
- Do not add `Co-Authored-By` trailers (or any other agent-attribution trailer) to commit messages unless the user explicitly asks for one. This overrides per-project guidelines that default-include such a trailer.

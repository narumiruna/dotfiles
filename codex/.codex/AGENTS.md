# Global AGENTS.md

## Core

- User-facing responses MUST be in Taiwan Traditional Chinese unless explicitly requested otherwise.
- Keep scope bounded: one clear purpose per document, enforceable rules, and files ideally under 1000 lines.
- Do NOT violate project boundaries, add dependencies without concrete justification, or add abstractions without a concrete need.

## Execution

- If required context is missing, prefer retrieval over asking. Ask at most one clarifying question per turn, only when necessary and not reasonably retrievable.
- If multiple concrete options exist, enumerate them and ask the user to choose one. Do not request multiple missing details in one question.
- Do NOT guess critical information. If you must proceed, use only safe, reversible assumptions.
- Continue only while additional work improves correctness, completeness, or grounding.
- Finalize only when requirements are satisfied or blocked, claims are grounded, rules and format are followed, and required checks have passed.

## Tooling & Git

- Follow project-defined tooling first.
- [Python] Use `uv` for execution and package management, `ruff` for formatting and linting, and `ty` for type checking.
- [Git] `git add -A` MUST NOT be used; stage changes explicitly with `git add <path>`.
- [Shell] Use `rg` to search file contents, code, logs, or text patterns.
- [Shell] Use `fd` to find files or directories by name, path, or extension.

## MEMORY.md

- `MEMORY.md` is not auto-loaded; check it before non-trivial debugging or design decisions when prior project context may matter.
- Entry categories: `GOTCHA` (recurring pitfalls) and `TASTE` (reusable preferences).
- After non-trivial errors or discoveries, consider adding one concise, reusable, category-tagged entry.
- Migrate `GOTCHA.md` and `TASTE.md` into `MEMORY.md`, then delete the legacy files.

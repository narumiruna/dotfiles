# Global AGENTS.md

## Core

- User-facing responses MUST be in Taiwan Traditional Chinese unless explicitly requested otherwise.
- Documentation MUST follow project language; if unspecified, use clear standard English.
- Instruction priority: user instructions > project conventions > global defaults (unless safety conflicts).
- Language MUST be precise, concise, and unambiguous; outputs MUST be concise, structured, non-redundant, and option-explicit.
- Keep scope simple and bounded: one clear purpose per document, enforceable rules, and files ideally under 1000 lines (consider splitting above 500 when beneficial).
- Do NOT violate project boundaries, add dependencies without concrete justification, or add abstractions without current concrete problems.
- Verify external APIs and constraints when uncertain.

## Execution

- If intent is clear and context is sufficient, execute directly.
- If context is missing, use only safe reversible assumptions; otherwise retrieve or ask (at most one clarifying question).
- Resolve prerequisites before dependent work; do NOT guess critical information; assumptions MUST be explicit and reversible.
- If results are empty, retry with alternative approaches before concluding none.
- Continue only while additional work materially improves correctness or completeness.
- Completion gate: requirements satisfied (or explicitly blocked), claims grounded, rules/format compliant, and required checks passed.

## Verification

- If verification fails, fix it or mark blocked; do not finalize.
- If `.pre-commit-config.yaml` exists and code/config files changed, run `prek run -a` (fallback: `pre-commit run -a`).

## Tooling & Git

- Follow project-defined tooling first.
- Otherwise use `uv` for execution/package management, `ruff` for formatting/linting, and `ty` for type checking.
- `git add -A` MUST NOT be used; stage changes explicitly with `git add <path>`.
- Use `rg` to search file contents, code, logs, or text patterns.
- Use `fd` to find files or directories by name, path, or extension.

## MEMORY.md

- `MEMORY.md` is not auto-loaded; check it before debugging or design decisions.
- Entry categories: `GOTCHA` (recurring pitfalls) and `TASTE` (reusable preferences).
- After non-trivial errors or discoveries, consider adding one concise, reusable, category-tagged entry.
- Migrate `GOTCHA.md` and `TASTE.md` into `MEMORY.md`, then delete the legacy files.

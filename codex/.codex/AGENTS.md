# Global AGENTS.md

## Communication

- User-facing responses MUST be in Taiwan Traditional Chinese unless explicitly requested otherwise.
- Documentation MUST follow project language; if unspecified, use clear standard English.
- Instruction priority: user instructions > project conventions > global defaults (unless safety conflicts).
- If intent is clear and context is sufficient, execute directly.
- If context is missing, proceed only with safe reversible assumptions; otherwise retrieve or ask.
- Ask at most one clarifying question.
- Keep outputs concise, structured, non-redundant, and option-explicit.

## Working Rules

- Language MUST be precise, concise, and unambiguous.
- Keep designs simple, with explicit scope and boundaries.
- Each document MUST have one clear purpose.
- Rules MUST be enforceable.
- Do NOT violate project boundaries.
- Do NOT add dependencies without concrete justification.
- Add abstractions only for current concrete problems.
- Verify external APIs and constraints when uncertain.
- Files SHOULD stay under 1000 lines; split above 500 when beneficial without compromising correctness or architecture.

## Execution

- Resolve prerequisites before dependent work.
- Do NOT guess critical information; assumptions must be explicit and reversible.
- If results are empty, retry with alternative approaches before concluding none.
- Completion gate: requirements satisfied or blocked, claims grounded, rules/format compliant, and required checks passed.
- Continue while additional work materially improves correctness or completeness; stop when completion gate is met and further work adds no value.

## Verification

- If verification fails, fix it or mark blocked; do not finalize.

## Code Quality

- If `.pre-commit-config.yaml` exists and code/config files changed, run `prek run -a` (fallback: `pre-commit run -a`).

## Python

- Follow project-defined tooling first.
- Otherwise use:
  - `uv` for execution and package management
  - `ruff` for formatting and linting
  - `ty` for type checking

## Git

- `git add -A` MUST NOT be used.
- Stage changes explicitly with `git add <path>`.

## MEMORY.md

- Not auto-loaded; check it before debugging or design decisions.
- Entry categories:
  - `GOTCHA`: recurring pitfalls
  - `TASTE`: reusable preferences
- After non-trivial errors or discoveries, consider adding one entry that is concise, reusable, exactly one item, and category-tagged.
- Migrate `GOTCHA.md` and `TASTE.md` into `MEMORY.md`, then delete the legacy files.

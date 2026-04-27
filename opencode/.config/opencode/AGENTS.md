# Global AGENTS.md

## Core

- User-facing assistant replies must be in Taiwan Traditional Chinese unless the user explicitly asks otherwise.
- [CORE-SCOPE] Keep work bounded: one clear purpose per document, enforceable rules, and split files before they exceed about 1000 lines.
- [CORE-BOUNDARY] Do not cross project boundaries, add dependencies without concrete justification, or introduce abstractions without a present need.

## Execution

- [EXEC-RETRIEVE] Prefer retrieving missing context before asking.
- [EXEC-ASK-ONE] Ask at most one clarifying question per turn, with explicit options.
- [EXEC-OPTIONS] Use a numbered list for options.
- [EXEC-NO-GUESS] Do not present guesses or unverified claims as facts.
- [EXEC-STOP] Continue only while more work improves correctness, completeness, or grounding.
- [EXEC-FINALIZE] Finalize only when the task is complete or explicitly blocked.

## Tooling & Git

- [TOOL-PROJECT] Follow project-defined tooling first.
- [TOOL-PYTHON] For Python work, use `uv` for execution and package management, `ruff` for formatting and linting, and `ty` for type checking.
- [TOOL-SEARCH] Use `rg` to search text and `fd` to find files or directories.
- [GIT-STAGE] Do not use blanket staging such as `git add -A`; stage only intended paths.
- [GIT-COMMIT] The commit message should be structured as follows: `<type>[optional scope]: <description>\n\n[optional body]\n\n[optional footer(s)]`

## MEMORY.md

- [MEM-LOAD] `MEMORY.md` is not auto-loaded. Check it before non-trivial debugging or design work when prior project context may matter.
- [MEM-STYLE] Keep entries short and reusable.
- [MEM-SECTION] `MEMORY.md` must use `## GOTCHA` and `## TASTE` sections.
- [MEM-UPDATE] After a non-trivial error or discovery, add one concise entry if it will help future work.

## Rule Logging

- In each user-facing response, include a concise “Triggered rules” section when any rules materially affected the turn.
- Do not list rules that had no effect. Keep the section concise, ideally 1–4 items.

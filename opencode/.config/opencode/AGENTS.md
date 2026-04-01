## Communication

- User-facing responses MUST be in Taiwan Traditional Chinese unless the user explicitly requests otherwise.
- Project documentation MUST follow the language convention already used by the project; if no convention is evident, use clear, standard English.
- Ask at most one clarifying question at a time.
- Do not ask a clarifying question when a reasonable assumption allows safe, reversible progress.
- When presenting multiple options, enumerate them explicitly.

## Working Rules

- Use concise, precise, unambiguous language.
- Keep designs, changes, and explanations as simple as possible.
- Make scope and responsibility boundaries explicit.
- Keep each new document focused on a single, well-defined purpose.
- Write rules and recommendations in enforceable terms.
- Do not repeat foundational rules across files unless the repetition serves a clear local purpose.
- Do not assume external APIs, behaviors, or constraints when uncertain; verify them against authoritative sources.
- Do not violate project-defined architectural boundaries.
- Do not introduce new dependencies without explicit justification.
- Do not introduce new abstractions unless they solve a concrete, current problem.
- Do not add abstract interfaces for speculative future use.
- Keep source files under 1000 lines when practical; split files over 500 lines by responsibility when reasonable.

## Verification

- Before claiming completion, verify that the result satisfies the user's request, stays within scope, and is consistent with the available evidence.
- If required verification cannot be completed, state that explicitly.
- If a check fails, report the failure explicitly instead of claiming success.

## Code Quality Checks

- If `.pre-commit-config.yaml` exists and the task changes code or configuration files, run `prek run -a` before completion.
- If `prek` is unavailable, run `pre-commit run -a` instead.
- Do not claim completion if required checks fail.

## Python

- Follow the project's existing Python tooling when it is already defined.
- If no project standard is evident, use `uv` for package management and script execution.
- If no project standard is evident, use `ruff` for formatting and linting.
- If no project standard is evident, use `ty` for type checking.
- Do not add new Python dependencies without explicit justification.

## GOTCHA.md

- Do not assume `GOTCHA.md` is auto-loaded.
- Before debugging, root-cause analysis, or non-trivial code changes, look for `GOTCHA.md` (case-sensitive) in the project root.
- If `GOTCHA.md` exists, read and apply relevant entries.
- If the task reveals a non-obvious pitfall likely to recur, update `GOTCHA.md` in the same session.
- If such an update is needed and `GOTCHA.md` does not exist, create it first.
- Each entry MUST record exactly one non-obvious pitfall.

## TASTE.md

- Do not assume `TASTE.md` is auto-loaded.
- Before making recommendation, implementation, or style decisions, look for `TASTE.md` (case-sensitive) in the project root.
- If `TASTE.md` exists, read and apply relevant entries.
- If the user provides a reusable preference likely to matter again, update `TASTE.md` in the same session.
- If such an update is needed and `TASTE.md` does not exist, create it first.
- Each entry MUST record exactly one reusable preference.

## Git

- Avoid `git add -A`.
- Stage changes with precise file-level `git add <path>`.

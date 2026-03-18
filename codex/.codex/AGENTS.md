## Communication

- User-facing communication MUST be written in Taiwan Traditional Chinese unless explicitly requested otherwise.
- Documentation MUST be written in clear, standard English.
- Ask at most one clarifying question at a time.
- Do not ask a clarifying question when a reasonable assumption allows safe progress.
- When presenting multiple options, enumerate them explicitly.

## Engineering Principles

- Language MUST be concise and precise.
- Design and structure MUST NOT introduce unnecessary complexity.
- Scope and responsibility boundaries MUST be explicit.
- Each document MUST have a single, well-defined purpose.
- Rules MUST be stated in enforceable terms and avoid ambiguity.
- Foundational rules MUST NOT be duplicated across documents.
- Do not assume external APIs; verify behavior or constraints when uncertain.

## Architectural Constraints

- Architectural boundaries defined by the project MUST NOT be violated.
- New dependencies MUST NOT be introduced without explicit justification.
- New abstractions MUST be introduced only to solve a concrete, current problem.
- Abstract interfaces MUST NOT be added for speculative future use alone.

## Code Quality Checks

- If `.pre-commit-config.yaml` exists and the task changes code or configuration files, all changes MUST pass `prek run -a` before completion.
- If `prek` is unavailable, `pre-commit run -a` MUST be used instead.
- If checks fail, the failure MUST be reported explicitly.

## Python

- Use `uv` for package management and script execution.
- Use `ruff` for formatting and linting.
- Use `ty` for type checking.
- New Python dependencies MUST NOT be added without explicit justification.

## Gotcha

- `GOTCHA.md` MUST NOT be assumed to be auto-loaded.
- Before debugging or proposing fixes, the agent MUST search the repository for gotchas.
- The agent MUST first look for `GOTCHA.md` (case-sensitive) in the project root.
- If root `GOTCHA.md` is not found, the agent MUST search for any file named `*GOTCHA*.md`.
- If no GOTCHA file exists, the agent MUST immediately create `./GOTCHA.md` (project root).
- After creating `GOTCHA.md`, the agent MUST continue the task and append a new entry only if a real non-obvious pitfall was discovered during the current session.
- If a GOTCHA file exists, the agent MUST read relevant entries and explicitly apply them in diagnosis and proposed fixes.
- Create or update a `GOTCHA.md` entry only for **non-obvious, experience-derived pitfalls** that required debugging to understand.

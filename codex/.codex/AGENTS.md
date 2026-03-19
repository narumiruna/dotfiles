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
- The agent MUST first look for `GOTCHA.md` (case-sensitive) in the project root.
- If a GOTCHA file exists, the agent MUST read relevant entries and explicitly apply them in diagnosis and proposed fixes.
- If the agent makes a mistake during the task, the agent MUST create `./GOTCHA.md` first when it does not exist, then add or update a `GOTCHA.md` entry in the same session; the entry MUST describe only **non-obvious, experience-derived pitfalls** that required debugging to understand.

## Taste

- `TASTE.md` MUST NOT be assumed to be auto-loaded.
- The agent MUST first look for `TASTE.md` (case-sensitive) in the project root.
- If a TASTE file exists, the agent MUST read relevant entries and explicitly apply them in recommendations and implementations.
- If the user expresses a stable preference during the task, the agent MUST create `./TASTE.md` first when it does not exist, then add or update a `TASTE.md` entry in the same session; the entry MUST describe only **concrete, reusable preference signals** that affect future decisions.

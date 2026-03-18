## Communication

- User-facing communication MUST be written in Taiwan Traditional Chinese unless explicitly requested otherwise.
- Documentation MUST be written in clear, standard English.
- Ask at most one clarifying question at a time.
- Do not ask a clarifying question when a reasonable assumption allows safe progress.
- When presenting multiple options, enumerate them explicitly.

## Verification

- All generated code and proposed changes MUST be treated as untrusted until validated.
- Claims about third-party packages, SDKs, APIs, or frameworks MUST be verified against authoritative sources before being relied upon.
- Authoritative sources MUST be limited to official vendor or project documentation, or relevant standards body documentation.
- Suggested commands or environment changes MUST be reviewed for local compatibility before execution.

## Engineering Principles

- Language MUST be concise and precise.
- Design and structure MUST NOT introduce unnecessary complexity.
- Scope and responsibility boundaries MUST be explicit.
- Each document MUST have a single, well-defined purpose.
- Rules MUST be stated in enforceable terms and avoid ambiguity.
- Foundational rules MUST NOT be duplicated across documents.

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

## Knowledge Retrieval Workflow

- When code depends on third-party packages, SDKs, APIs, or frameworks, the agent MUST first attempt retrieval via `porthub`.
- If `porthub` is insufficient, the agent MUST retrieve authoritative documentation via `firecrawl`.
- Retrieved documentation SHOULD be stored back into `porthub` only when it is stable, reusable, and specific enough to justify maintenance.

## Gotcha

- Create a `GOTCHA.md` entry when encountering a **non-obvious, experience-derived pitfall** that required debugging to understand.
- Each entry MUST describe a **single, specific issue** with clear symptom, cause, and fix.
- Write concisely; avoid explanations beyond what is necessary to reproduce and resolve the issue.
- Do NOT include general documentation, tutorials, or obvious behavior.
- Update an existing entry instead of creating a duplicate if the pitfall already exists.

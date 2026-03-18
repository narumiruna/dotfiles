## Language and Style

- Documentation **MUST** be written in clear, standard English following established conventions.
- Communication **MUST** be clear and easily understandable in Taiwan Traditional Chinese.
- Ask me only one question at a time to avoid confusion.
- Enumerate options when providing multiple choices.

## Code Quality Checks

- If `.pre-commit-config.yaml` exists, all code changes **MUST** pass `prek run -a` before completion; otherwise, no pre-commit check is required.

## Principles

- Language MUST be concise and precise.
- Design and structure MUST NOT introduce unnecessary complexity.
- Scope and responsibility boundaries MUST be explicit.
- Each document MUST have a single, well-defined purpose.
- Rules MUST be stated in enforceable terms and avoid ambiguity.
- Foundational rules MUST NOT be duplicated across documents.

## Fundamental Constraints

- All outputs and changes MUST be treated as untrusted unless and until explicitly verified.
- Abstractions MUST address a concrete, current problem that exists at the time of introduction.
- Architectural boundaries defined by the project MUST NOT be violated.
- New dependencies MUST NOT be introduced without explicit justification.

## Python

- Use `uv` for package management and script execution.
- Use `ruff` for code formatting and linting.
- Use `ty` for type checking.

## Skills and Tools

- When code depends on third-party packages, the agent MUST first attempt retrieval via `porthub`.
- If `porthub` is insufficient, the agent MAY use `firecrawl` to retrieve authoritative documentation.
- Newly retrieved external documentation SHOULD be stored back into `porthub` when it is stable, relevant, and worth reusing.

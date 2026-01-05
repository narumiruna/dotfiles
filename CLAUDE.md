# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for terminal applications and custom Claude Code skills. The repository manages configurations for Ghostty terminal, tmux, and provides a collection of reusable skills for Python and MCP development.

## Common Commands

### Installing Dotfiles
```bash
./install.sh
```
Installs Ghostty and tmux configuration files to their respective system locations (`~/.config/ghostty/config` and `~/.tmux.conf`). Prompts before overwriting existing configurations.

### Syncing Skills
```bash
./sync_skills.sh
```
Syncs the skills directory to both `~/.codex/skills/` and `~/.claude/skills/` using rsync. Requires rsync to be installed.

## Architecture

### Skills System

The `skills/` directory contains modular, self-contained packages that extend Claude's capabilities:

**Available Skills:**
- **mcp-builder**: Guide for creating MCP (Model Context Protocol) servers in Python (FastMCP) or TypeScript (MCP SDK)
- **python-conventions**: Python 3.12+ coding conventions focusing on style, naming, typing, and error handling
- **python-project**: Python project workflow using Astral uv, ruff, pytest, ty, typer, and loguru
- **skill-creator**: Guide for creating new skills

**Skill Structure:**
Each skill follows a consistent structure:
- `SKILL.md` (required): YAML frontmatter with name/description, followed by markdown instructions
- `references/` (optional): Documentation loaded as needed
- `scripts/` (optional): Executable code for deterministic tasks
- `assets/` (optional): Files used in output (templates, boilerplate)

The skills use progressive disclosure: metadata is always in context, SKILL.md loads when triggered, and resources load only as needed.

### Configuration Files

**Ghostty** (`ghostty/config`):
- Font: MesloLGS Nerd Font Mono (16pt)
- Theme: Molokai
- Features: copy-on-select, window state saving, zsh shell integration

**Tmux** (`tmux/config`):
- Minimal configuration enabling mouse support

### Scripts

**schwab.py**: Standalone Python script with inline PEP 723 metadata (requires Python 3.11+, pandas). Parses financial data from raw string format into CSV with date sorting and deduplication.

**trash/**: Contains deprecated/archived installation scripts for CUDA, pyenv, and zsh.

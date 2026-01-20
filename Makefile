# Makefile for dotfiles management using GNU Stow
#
# Quick Start:
#   make          - Install all packages
#   make help     - Show available targets

.DEFAULT_GOAL := all

# Configuration
STOW       := stow
STOW_FLAGS := --restow -v
TARGET     := ~

SKILLS_CODEX_DIR  := ~/.codex/skills
SKILLS_CLAUDE_DIR := ~/.claude/skills

# Platform-specific targets
UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
	PLATFORM_TARGETS := macos-defaults ghostty
else
	PLATFORM_TARGETS :=
endif

# Main target
all: zsh starship fish git tmux $(PLATFORM_TARGETS)
	@echo "✓ All packages installed"

# Individual packages
fish:
	@$(STOW) $(STOW_FLAGS) -t $(TARGET) fish

git:
	@$(STOW) $(STOW_FLAGS) -t $(TARGET) git

ghostty:
	@$(STOW) $(STOW_FLAGS) -t $(TARGET) ghostty

macos-defaults:
	@$(STOW) $(STOW_FLAGS) -t $(TARGET) macos-defaults

starship:
	@$(STOW) $(STOW_FLAGS) -t $(TARGET) starship

tmux:
	@$(STOW) $(STOW_FLAGS) -t $(TARGET) tmux

zsh:
	@$(STOW) $(STOW_FLAGS) -t $(TARGET) zsh

# Skills
skills:
	@mkdir -p $(SKILLS_CODEX_DIR)
	$(STOW) $(STOW_FLAGS) -t $(SKILLS_CODEX_DIR) skills
	@mkdir -p $(SKILLS_CLAUDE_DIR)
	$(STOW) $(STOW_FLAGS) -t $(SKILLS_CLAUDE_DIR) skills
	@echo "✓ Skills installed"

# Maintenance
clean:
	@echo "Removing symlinks..."
	-@$(STOW) -D -t $(TARGET) zsh starship fish git tmux 2>/dev/null || true
	-@$(STOW) -D -t $(TARGET) ghostty macos-defaults 2>/dev/null || true
	-@$(STOW) -D -t $(SKILLS_CODEX_DIR) skills 2>/dev/null || true
	-@$(STOW) -D -t $(SKILLS_CLAUDE_DIR) skills 2>/dev/null || true
	@echo "✓ Cleanup complete"

# Help
help:
	@echo "Dotfiles Management"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@printf "  %-15s  %s\n" "all" "Install core packages (default)"
	@printf "  %-15s  %s\n" "fish" "Install Fish shell config"
	@printf "  %-15s  %s\n" "git" "Install Git config"
	@printf "  %-15s  %s\n" "ghostty" "Install Ghostty terminal config"
	@printf "  %-15s  %s\n" "macos-defaults" "Install macOS defaults"
	@printf "  %-15s  %s\n" "starship" "Install Starship prompt"
	@printf "  %-15s  %s\n" "tmux" "Install Tmux config"
	@printf "  %-15s  %s\n" "zsh" "Install Zsh config"
	@printf "  %-15s  %s\n" "skills" "Install skill bundles"
	@printf "  %-15s  %s\n" "clean" "Remove all symlinks"
	@printf "  %-15s  %s\n" "help" "Show this help"
	@echo ""

.PHONY: all fish git ghostty macos-defaults starship tmux zsh skills clean help

# Makefile for dotfiles management using GNU Stow
# Use 'make' or 'make all' to install configs
# Use 'make help' for available targets

# Variables
STOW := stow
STOW_FLAGS := --restow -v
TARGET := ~
SKILLS_CODEX_DIR := ~/.codex/skills
SKILLS_CLAUDE_DIR := ~/.claude/skills

# Default target
.DEFAULT_GOAL := all

# Detect OS
UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
	PLATFORM_TARGETS := macos-defaults ghostty
else
	PLATFORM_TARGETS :=
endif

# Install all packages
all: zsh starship fish git tmux $(PLATFORM_TARGETS)
	@echo "✓ All packages installed"

# Individual package targets
starship:
	$(STOW) $(STOW_FLAGS) -t $(TARGET) starship

fish:
	$(STOW) $(STOW_FLAGS) -t $(TARGET) fish

zsh:
	$(STOW) $(STOW_FLAGS) -t $(TARGET) zsh

git:
	$(STOW) $(STOW_FLAGS) -t $(TARGET) git

tmux:
	$(STOW) $(STOW_FLAGS) -t $(TARGET) tmux

ghostty:
	$(STOW) $(STOW_FLAGS) -t $(TARGET) ghostty

macos-defaults:
	$(STOW) $(STOW_FLAGS) -t $(TARGET) macos-defaults

# Install skill bundles
skills:
	@mkdir -p $(SKILLS_CODEX_DIR)
	$(STOW) $(STOW_FLAGS) -t $(SKILLS_CODEX_DIR) skills
	@mkdir -p $(SKILLS_CLAUDE_DIR)
	$(STOW) $(STOW_FLAGS) -t $(SKILLS_CLAUDE_DIR) skills
	@echo "✓ Skills installed"

# Uninstall all packages
clean:
	@echo "Removing symlinks..."
	-$(STOW) -D -t $(TARGET) zsh starship fish git tmux 2>/dev/null || true
	-$(STOW) -D -t $(TARGET) ghostty 2>/dev/null || true
	-$(STOW) -D -t $(TARGET) macos 2>/dev/null || true
	-$(STOW) -D -t $(SKILLS_CODEX_DIR) skills 2>/dev/null || true
	-$(STOW) -D -t $(SKILLS_CLAUDE_DIR) skills 2>/dev/null || true
	@echo "✓ Cleanup complete"

# Show help message
help:
	@echo "Dotfiles Management Makefile"
	@echo ""
	@echo "Usage:"
	@printf "  make [target]\n\n"
	@printf "Targets:\n"
	@printf "  %-17s %s\n" "all (default)" "Install zsh, starship, fish, git, tmux"
	@printf "  %-17s %s\n" "zsh" "Install Zsh configuration"
	@printf "  %-17s %s\n" "starship" "Install Starship prompt"
	@printf "  %-17s %s\n" "fish" "Install Fish shell configuration"
	@printf "  %-17s %s\n" "git" "Install Git configuration"
	@printf "  %-17s %s\n" "tmux" "Install Tmux configuration"
	@printf "  %-17s %s\n" "macos-defaults" "Reset Launchpad and stop .DS_Store on network volumes"
	@printf "  %-17s %s\n" "ghostty" "Install Ghostty terminal config"
	@printf "  %-17s %s\n" "skills" "Install Codex/Claude skill bundles"
	@printf "  %-17s %s\n" "clean" "Remove all symlinks"
	@printf "  %-17s %s\n" "help" "Show this help message"

.PHONY: all starship fish zsh git tmux ghostty skills macos clean help

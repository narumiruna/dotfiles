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

# Install all packages
all: zsh starship fish git tmux
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

# macOS-specific configs
macos: all
	$(STOW) $(STOW_FLAGS) -t $(TARGET) macos
	@echo "✓ macOS-specific packages installed"

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
	@echo "  make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  all          Install all packages (zsh, starship, fish, git, tmux)"
	@echo "  macos        Install all packages + macOS-specific configs"
	@echo "  ghostty      Install Ghostty terminal config"
	@echo "  skills       Install Codex/Claude skill bundles"
	@echo "  clean        Remove all symlinks"
	@echo "  help         Show this help message"
	@echo ""
	@echo "Individual packages:"
	@echo "  zsh          Install Zsh configuration"
	@echo "  starship     Install Starship prompt"
	@echo "  fish         Install Fish shell configuration"
	@echo "  git          Install Git configuration"
	@echo "  tmux         Install Tmux configuration"

.PHONY: all starship fish zsh git tmux ghostty skills macos clean help

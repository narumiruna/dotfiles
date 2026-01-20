# Makefile for dotfiles management using GNU Stow
# Use 'make' or 'make all' to install common configs
# Use 'make help' for available targets

# Variables
STOW := stow
STOW_FLAGS := --restow -v
TARGET := ~

# Common packages for all platforms
COMMON_PACKAGES := zsh starship fish git tmux

# Default target
.DEFAULT_GOAL := all

# Install all common packages
all: $(COMMON_PACKAGES)
	@echo "✓ All common packages installed"

# Install common packages (alias for 'all')
linux: all

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
	@mkdir -p ~/.codex/skills
	$(STOW) $(STOW_FLAGS) -t ~/.codex/skills skills
	@mkdir -p ~/.claude/skills
	$(STOW) $(STOW_FLAGS) -t ~/.claude/skills skills
	@echo "✓ Skills installed"

# Uninstall all packages
clean:
	@echo "Removing symlinks..."
	-$(STOW) -D -t $(TARGET) $(COMMON_PACKAGES) 2>/dev/null || true
	-$(STOW) -D -t $(TARGET) ghostty 2>/dev/null || true
	-$(STOW) -D -t $(TARGET) macos 2>/dev/null || true
	-$(STOW) -D -t ~/.codex/skills skills 2>/dev/null || true
	-$(STOW) -D -t ~/.claude/skills skills 2>/dev/null || true
	@echo "✓ Cleanup complete"

# Show help message
help:
	@echo "Dotfiles Management Makefile"
	@echo ""
	@echo "Usage:"
	@echo "  make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  all          Install common packages (zsh, starship, fish, git, tmux)"
	@echo "  linux        Alias for 'all' - works on both Linux and macOS"
	@echo "  macos        Install common packages + macOS-specific configs"
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

.PHONY: all linux starship fish zsh git tmux ghostty skills macos clean help

all: zsh starship fish git tmux

starship:
	stow -t ~ starship

fish:
	stow -t ~ fish

zsh:
	stow -t ~ zsh

git:
	stow -t ~ git

tmux:
	stow -t ~ tmux

ghostty:
	stow -t ~ ghostty

macos:
	stow -t ~ macos

skills:
	mkdir -p ~/.codex/skills
	stow -t ~/.codex/skills skills
	mkdir -p ~/.claude/skills
	stow -t ~/.claude/skills skills

.PHONY: all starship fish zsh git tmux ghostty skills macos

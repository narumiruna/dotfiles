linux: zsh-linux common

macos: zsh-macos common

common: starship fish git tmux

starship:
	stow -t ~ starship

fish:
	stow -t ~ fish

zsh-linux:
	stow -t ~ zsh-linux

zsh-macos:
	stow -t ~ zsh-macos

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

.PHONY: linux macos common starship fish zsh-linux zsh-macos git tmux ghostty skills macos

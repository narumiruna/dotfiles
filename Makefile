stow-linux: zsh-linux common

stow-macos: zsh-macos common

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

codex-skills:
	mkdir -p ~/.codex/skills
	stow -t ~/.codex/skills skills

claude-skills:
	mkdir -p ~/.claude/skills
	stow -t ~/.claude/skills skills

.PHONY: stow-linux stow-macos common starship fish zsh-linux zsh-macos git tmux ghostty codex-skills claude-skills
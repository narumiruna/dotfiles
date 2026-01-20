if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  extract
  git
  tmux
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=C.UTF-8
export EDITOR='vim'

. "$HOME/.cargo/env"

# macOS
source $HOME/.config/zsh/brew.zsh
source $HOME/.config/zsh/code.zsh

# common
source $HOME/.config/zsh/atuin.zsh
source $HOME/.config/zsh/bun.zsh
source $HOME/.config/zsh/pyenv.zsh
source $HOME/.config/zsh/fnm.zsh

. "$HOME/.local/bin/env"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

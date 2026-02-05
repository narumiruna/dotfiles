export ZSH="$HOME/.oh-my-zsh"
plugins=(
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

source $HOME/.config/zsh/alias.zsh

path=("$HOME/.cargo/bin" $path)

# macOS
source $HOME/.config/zsh/brew.zsh
source $HOME/.config/zsh/code.zsh

# common
source $HOME/.config/zsh/atuin.zsh
source $HOME/.config/zsh/bun.zsh
source $HOME/.config/zsh/pyenv.zsh
source $HOME/.config/zsh/fnm.zsh

path=("$HOME/.local/bin/env" $path)

eval "$(starship init zsh)"

# remove duplicate entries in PATH
path=(${(u)path})

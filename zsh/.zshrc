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
export LC_ALL=C.UTF-8
export EDITOR='vim'

source $HOME/.config/zsh/alias.zsh

path=("$HOME/.cargo/bin" $path)

# macOS
source $HOME/.config/zsh/brew.zsh
source $HOME/.config/zsh/code.zsh

# common
source $HOME/.config/zsh/pyenv.zsh
source $HOME/.config/zsh/fnm.zsh

path=("$HOME/.local/bin" $path)

# remove duplicate entries in PATH
path=(${(u)path})

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# atuin
path=("$HOME/.atuin/bin" $path)
eval "$(atuin init zsh --disable-up-arrow)"

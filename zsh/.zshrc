if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
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

alias ls="lsd"
alias lsa="lsd -lah"
alias l="lsd -lah"
alias ll="lsd -lh"
alias la="lsd -lAh"

alias gst="git status"
alias gph="git push origin HEAD"
alias gd="git diff"
alias gds="git diff --staged"

alias extract="ouch decompress -y"

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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

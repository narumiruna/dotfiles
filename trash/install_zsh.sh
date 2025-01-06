#!/bin/bash

sudo apt-get update
sudo apt-get install -y curl git zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/narumiruna/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

curl https://raw.githubusercontent.com/narumiruna/scripts/master/zshrc --output ${HOME}/.zshrc

env zsh -l

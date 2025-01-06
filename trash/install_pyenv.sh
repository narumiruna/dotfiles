#!/bin/bash

# https://github.com/pyenv/pyenv/wiki
sudo apt-get update
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

git clone https://github.com/pyenv/pyenv.git ${HOME}/.pyenv

echo '# pyenv' >> ${HOME}/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ${HOME}/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ${HOME}/.zshrc
echo 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ${HOME}/.zshrc

env zsh -l

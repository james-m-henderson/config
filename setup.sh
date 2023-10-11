#!/bin/bash

set -x # show your work
set -e # exit on error

if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen
fi

if [ ! -f ~/.ssh/known_hosts ]; then
  ssh-keyscan github.com >> ~/.ssh/known_hosts
fi

# install homebrew

if [ ! -e /opt/homebrew ]; then
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Fixing homebrew path"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew tap homebrew/cask-fonts

brew install git

if [ ! -e ~/.config ]; then
  git clone git@github.com:james-m-henderson/config.git ~/.config
fi

pushd ~/.config
git pull
popd

brew install docker --cask
brew install font-agave-nerd-font neovim git zsh lazygit ripgrep fd kitty lua lazydocker

if [ ! -e ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
fi

if [ ! -f ~/.zshrc.local ]; then
  cp ~/.config/.zshrc.local.template ~/.zshrc.local
  echo "fill in .zshrc.local"
fi

echo "source ~/.config/zshrc" > ~/.zshrc

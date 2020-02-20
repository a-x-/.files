#!/bin/sh

# !WARN! INSTALLER IS NOT COMPLETE

# install something else: https://github.com/a-x-/apps

xcode-select --install

# todo: create some symlinks in `~`
ln -s .files/.zshrc .files/.gitconfig .files/.tmux/ .files/.tmux.conf .files/.vimrc .files/.profile .

echo install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
. ~/.zshrc

# install https://github.com/Shougo/dein.vim

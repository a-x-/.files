#!/bin/sh

# !WARN! INSTALLER IS NOT COMPLETE

echo install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
. ~/.zshrc

# todo: create some symlinks in `~`
# install something else: https://github.com/a-x-/apps

# install https://github.com/Shougo/dein.vim

#!/bin/sh


#
#
echo "\n\n install brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# xcode-select --install # — brew installs it itself


#
#
echo "\n\n create some symlinks at home dir..."
ln -s .files/.zshrc .files/.gitconfig .files/.tmux/ .files/.tmux.conf .files/.vimrc .files/.profile .


#
#
echo "\n\n install brew packages"
IGNORE_COMMENTS='s/#.+//'
brew install git && \
mkdir ~/xp && cd ~/xp && \
git clone https://github.com/a-x-/apps.git && cd apps && \
cat ~/xp/apps/brew.list       | sed -E $IGNORE_COMMENTS | xargs brew install && \
cat ~/xp/apps/brew-cask.list  | sed -E $IGNORE_COMMENTS | xargs brew cask install&& \
cat ~/xp/apps/npm.list        | sed -E $IGNORE_COMMENTS | xargs npm -g install&& \
cat ~/xp/apps/vscode.list     | sed -E $IGNORE_COMMENTS | while read f; do code --install-extension $f; done


#
#
echo "\n\n install zplug..."
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
. ~/.zshrc
# Install plugins if there are plugins that have not been installed
zplug install

# install https://github.com/Shougo/dein.vim

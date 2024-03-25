#!/bin/sh


#
#
echo "\n\n install brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# xcode-select --install # — brew installs it itself


#
#
echo "\n\n create some symlinks at home dir..."
ln -s .files/.zprofile .files/.gitconfig .files/.tmux/ .files/.tmux.conf .files/.vimrc .files/.profile .files/.hyper.js .
mkdir ~/.nvm


#
#
echo "\n\n install brew packages"
brew install git && \
mkdir ~/xp && cd ~/xp && \
git clone https://github.com/a-x-/apps.git && cd apps && \
cat ~/xp/apps/brew.list       | sed -E '/^#|^$/d' | sed -E 's/#.*//' | xargs brew install && \
cat ~/xp/apps/brew-cask.list  | sed -E '/^#|^$/d' | sed -E 's/#.*//' | xargs brew install&& \
cat ~/xp/apps/npm.list        | sed -E '/^#|^$/d' | sed -E 's/#.*//' | xargs npm -g install&& \
cat ~/xp/apps/vscode.list     | sed -E '/^#|^$/d' | sed -E 's/#.*//' | while read f; do code --install-extension $f; done


#
#
echo "\n\n install zplug..."
. ~/.zprofile
# Install plugins if there are plugins that have not been installed
zplug install

# manually install: https://github.com/junegunn/vim-plug
# 1. curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# 2. run vim and call `:PlugInstall`

# Fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-input

#
#
echo "\n\n setup everything"
echo "Please, run Bunch of automatic settings at https://github.com/a-x-/apps/blob/master/prepare-installed-os.md"

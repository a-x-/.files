#!/bin/sh


#
#
echo "\n\n install brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# xcode-select --install # — brew installs it itself


#
#
echo "\n\n create some symlinks at home dir..."
ln -s .files/.zprofile .files/.gitconfig .files/.gitattributes .files/.tmux/ .files/.tmux.conf .files/.vimrc .files/.profile .files/.hyper.js .
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

echo ❗❕❗❕❗❕❗❕❗
echo ❗❕❗❕❗❕❗❕❗
echo install manually: 
echo https://github.com/junegunn/vim-plug
echo ❗❕❗❕❗❕❗❕❗
echo 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo
echo 'run vim and call ":PlugInstall"'
echo ❗❕❗❕❗❕❗❕❗
echo ❗❕❗❕❗❕❗❕❗


# Fonts
# brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-input

# gh copilot
gh auth login
gh extension install github/gh-copilot

#
#
echo "\n\n setup everything"
echo "Please, run Bunch of automatic settings at https://github.com/a-x-/apps/blob/master/prepare-installed-os.md"

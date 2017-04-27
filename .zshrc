echo ZSHRC

source ~/.profile

fpath=(~/.zsh/zsh-completions/src $fpath)

autoload -U compinit && compinit
#setopt PROMPT_SUBST

source ~/dotfiles/keybindings.zsh
source ~/dotfiles/history.zsh
source ~/dotfiles/misc.zsh

export PS1='%S%B %2~ ❯ %s%b '

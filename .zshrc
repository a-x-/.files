echo ZSHRC

source ~/.profile

fpath=(~/.zsh/zsh-completions/src $fpath)

autoload -U compinit && compinit
#setopt PROMPT_SUBST

source ~/dotfiles/.zsh_keybindings
source ~/dotfiles/history.zsh
source ~/dotfiles/misc.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PS1='%S%B %2~ ❯ %s%b '

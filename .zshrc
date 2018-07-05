echo ZSHRC

source ~/.profile

fpath=(~/.zsh/zsh-completions/src $fpath)

autoload -U compinit && compinit
#setopt PROMPT_SUBST

source ~/dotfiles/keybindings.zsh
source ~/dotfiles/history.zsh
source ~/dotfiles/misc.zsh
source ~/dotfiles/spectrum.zsh

#export PS1='%S%B %2~ ❯ %s%b '
export PS1='%2~ ❯ %s'

setopt PROMPT_SUBST
# export RPROMPT='$(~/.cabal/bin/git-prompt green)'
export RPROMPT='$(git-get-branch 2>/dev/null)'

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh


# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /Users/mxtnr/xp/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/mxtnr/xp/yarn-completions/node_modules/tabtab/.completions/yarn.zsh

autoload -U zmv # Mass renaming files with zmv

source ~/git-flow-completion.zsh

#source ~/.bin/tmuxinator.zsh

unsetopt EXTENDED_GLOB

export EMAIL=alex@rocketguys.com

export PATH="./node_modules/.bin/:$PATH"

echo PROFILE
for file in exports aliases; do source ~/dotfiles/.${file}; done
unset file

eval "$(fasd --init auto)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

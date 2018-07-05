echo PROFILE
for file in exports aliases; do source ~/dotfiles/.${file}; done
unset file

eval "$(fasd --init auto)"

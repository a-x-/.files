# ---------------------------------------------------
# ZSH SPECIFIC Aliases and functions
# ---------------------------------------------------

alias zshc="vim ~/.zprofile; source ~/.zprofile"
# alias ohmyzsh="~/.oh-my-zsh"

# ^Z instead of `fg`
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        fg
        zle redisplay
    else
        zle push-input
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# ^P — run pwd
#function pwd-wrapper() { pwd }; zle -N pwd pwd-wrapper; bindkey '^P' pwd;

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

alias -g '|/'='| grep -i' # / foo |/ bar #= grep foo | grep bar

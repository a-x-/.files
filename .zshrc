source ~/.zplug/init.zsh

source ~/.profile
for file in keybindings history misc spectrum aliases; do source ~/dotfiles/${file}.zsh; done
unset file

#
# completion
#

fpath=(~/.zsh/zsh-completions/src $fpath)
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "zsh-users/zsh-completions"
# autoload -U compinit && compinit

# cached completion https://blog.callstack.io/supercharge-your-terminal-with-zsh-8b369d689770
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# menu list from where we can highlight and select completion results
zmodload -i zsh/complist


#
# prompt
#

#setopt PROMPT_SUBST
#export PS1='%S%B %2~ ❯ %s%b '
export PS1='%2~ ❯ %s'

setopt PROMPT_SUBST
# export RPROMPT='$(~/.cabal/bin/git-prompt green)'
export RPROMPT='$(git-get-branch 2>/dev/null)'

#
# Plugins
#

zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL='❯'
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_CHAR_SYMBOL_ROOT='# '
SPACESHIP_GIT_STATUS_SHOW=false
SPACESHIP_HG_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_GIT_BRANCH_COLOR=white


# ZSH port of Fish shell's history search feature https://github.com/zsh-users/zsh-history-substring-search
zplug "zsh-users/zsh-history-substring-search"

# UX Proactive tips
zplug "djui/alias-tips"

# Fish-like autosuggestions for zsh
zplug "zsh-users/zsh-autosuggestions"

zplug "marzocchi/zsh-notify"

# # Enable zsh-autosuggestions
# zle-line-init() {
#     zle autosuggest-start
# }
# zle -N zle-line-init
AUTOSUGGESTION_ACCEPT_RIGHT_ARROW=1
ZSH_AUTOSUGGEST_USE_ASYNC=1 # async

# zsh-history-substring-search
# bind UP and DOWN arrow keys
# zmodload zsh/terminfo
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down
#
# # bind UP and DOWN arrow keys (compatibility fallback
# # for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


#autoload -U zmv # Mass renaming files with zmv

#source ~/.bin/tmuxinator.zsh

unsetopt EXTENDED_GLOB
setopt noclobber # >, >! — rewrite safety

# MUST BE AT END OF .ZSHRC
# Fish shell like syntax highlighting for Zsh
zplug "zdharma/fast-syntax-highlighting"
# zplug "zsh-users/zsh-syntax-highlighting"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# Then, source plugins and add commands to $PATH
zplug load #--verbose

# setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

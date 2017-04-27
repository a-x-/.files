# Use emacs key bindings: ^A, ^E
bindkey -e

# fix Alt-left/right (also have to use iterm2 key preset named 'Natural...')
bindkey '^[f' forward-word
bindkey '^[b' backward-word

# [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line


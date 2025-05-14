
for file in exports aliases; do source ~/.files/${file}.sh; done
unset file

#
# Front
#
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export PATH="./node_modules/.bin/:$PATH"
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

#
# General Purpose Exports
#

export EMAIL=invntrm@gmail.com
#export EDITOR='mvim -v'
#export EDITOR='vim'
export EDITOR='code'
export REACT_EDITOR=code
export LANG=en_US.UTF-8
export BASH_SILENCE_DEPRECATION_WARNING=1
export BUN_INSTALL="$HOME/.bun" 
export PATH="$BUN_INSTALL/bin:$HOME/.files/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="$PATH:$HOME/.files/ts-import-trace/bin"

#
# HELPERS
#

#eval $(thefuck --alias)
#eval "$(fasd --init auto)"

# added by travis gem
#[ -f /Users/mxtnr/.travis/travis.sh ] && source /Users/mxtnr/.travis/travis.sh

# Copy idiot's formatted shell-code w/o a pain
alias %=' '

#
# Completion
#

# which npm 2>/dev/null 1>&2 && (. <(npm completion))2>/dev/null

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
# [[ -f /Users/mxtnr/xp/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/mxtnr/xp/yarn-completions/node_modules/tabtab/.completions/yarn.zsh



if [[ $RANDOM > 8191 ]]; then
  echo
  echo
  get-random-alias-help
  echo '_____________________________'
  echo '       \'
  echo '        \  .\__/.       '
  echo '         \  (oo)\_______'
  echo '            (_.)\       )\/\'
  echo '                ||----w |'
  echo '                ||     ||'
fi
eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
# eval "$(/opt/homebrew/bin/brew shellenv)"


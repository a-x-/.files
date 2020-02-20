#
# Front
#
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export PATH="./node_modules/.bin/:$PATH"

#
# General Purpose Exports
#

export EMAIL=invntrm@gmail.com
export EDITOR='mvim -v'
export REACT_EDITOR=code
export PATH=~/.files/bin:$PATH
export LANG=en_US.UTF-8

#
# HELPERS
#

eval $(thefuck --alias)
eval "$(fasd --init auto)"

for file in exports aliases; do source ~/dotfiles/${file}.sh; done
unset file

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

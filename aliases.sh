alias py=python3

alias ll='ls -Foalh'

# git

alias gs='git status'
alias gca='git commit --no-ed --amend'
alias gcaa='git commit -a --no-ed --amend'
alias gf='git fetch --all --prune' # fetch & clear old branches
alias grd='gf;git rebase origin/master' # rebase trunk
alias gr='git remote -v' # show remotes
alias gp='git push'
alias gpf='git push --force'
alias gl='git lol'
alias gla='git lola'
alias gsync='git pull --rebase && git push'
alias gpr='hub pull-request'
# alias gles='/usr/local/bin/gl'

alias ggc=git-get-changed # print list of any changed files in stage/unstage
alias gse='$EDITOR $(git-get-changed)' # git status: edit all changed files

alias go='git open'
alias gup=gh-get-url-by-path

alias ggr=git-get-root

function gc__() {
    msg="$@"; git commit -am "$msg"
}
alias gc='noglob gc__'
function gcn() {
    msg="$@"; git commit -anm "$msg"
}
function gcm() {
    msg="$@"; git commit -m "$msg"
}
function grsc() {
    git reset @ $*; git checkout $*
}

function get_diff_exclude() {
  echo "':(exclude)package-lock.json' ':(exclude)$(git-get-root)/public/webpack/admin'"
}
function gd() {
  eval git diff --relative --ignore-space-change $* -- . $(get_diff_exclude)
}
function gdc() {
  eval git diff --relative --cached --ignore-space-change $* -- . $(get_diff_exclude)
}
function gdd() {
  eval git diff --relative origin/master --ignore-space-change $* -- . $(get_diff_exclude)
}

alias git-init="git init && echo '# MacOS #' > .gitignore && curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore >> .gitignore && gsed -i '/Icon/d' .gitignore && echo '# Node #' >> .gitignore && curl https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore >> .gitignore"

# /git

# misc
alias /='rg'
alias copy=pbcopy
alias vim='mvim -v'
alias svgo='svgo --enable=removeTitle --enable=removeUselessStrokeAndFill --enable=collapseGroups --enable=removeUselessDefs --enable=cleanupIDs'

alias take-webcam-picture="imagesnap -w 1"
alias camcap=take-webcam-picture
function take() {
  mkdir $1; cd $1
}
function gcopen() {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app="$*"
}

function touchf() {
    file_path=$1
    dir_path="$(echo $file_path | grep -oE '^.+/')"

    # file_name="$(echo $file_path | grep -oE '[^/]+$')"
    [ "$(echo $dir_path)" ] && mkdir -p $dir_path
    # cd $dir_path
    touch $file_path
}

function mvf() {
    touchf "$2"
    mv "$1" "$2"
}

function vimf() {
    touchf "$1"
    vim "$1"
}

# /misc

# npm maintenance bash scripts
# alias patch='pre-version && npm version patch && post-version'
# alias minor='pre-version && npm version minor && post-version'
# alias major='pre-version && npm version major && post-version'
# alias pre-version='git diff --exit-code && npm test'
# alias post-version='(git add package-lock.json && git add package-lock.json && git commit --amend --no-ed || :) && npm run --if-present build && git add . && git commit -m build && git diff --exit-code && git push && git push --tags && npm publish'
# /npm maintenance bash scripts


alias -g '|/'='| grep -i' # / foo |/ bar #= grep foo | grep bar

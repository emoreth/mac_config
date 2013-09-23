#!/bin/sh
alias ll="ls -lah"


if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
_completion_loader git



__define_git_completion () {
  eval "
      _git_$2_shortcut () {
          COMP_LINE=\"git $2\${COMP_LINE#$1}\"
          let COMP_POINT+=$((4+${#2}-${#1}))
          COMP_WORDS=(git $2 \"\${COMP_WORDS[@]:1}\")
          let COMP_CWORD+=1
          local cur words cword prev
         _get_comp_words_by_ref -n =: cur words cword prev
         _git_$2
      }
  "
}


# GIT
#alias gp="git push"
_gitshortcut  gp       push
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpod="git push origin devel"
#alias gl="git pull"
__gitshortcut  gl       pull
alias glo="git pull origin"
alias glom="git pull origin master"
alias glod="git pull origin devel"
#alias glr="git pull --rebase"
__gitshortcut  glr      pull --rebase
#alias glro="git pull --rebase origin"
__gitshortcut  glro     pull '--rebase origin'
#alias glrom="git pull --rebase origin master"
__gitshortcut  glrom    pull '--rebase origin master'
#alias glrod="git pull --rebase origin devel"
__gitshortcut  glrod    pull '--rebase origin devel'
#alias gc="git commit"
__gitshortcut  gc       commit
#alias gca='git commit -a'
__gitshortcut  gca      commit -a
#alias gco="git checkout"
__gitshortcut  gco      checkout
alias gcom="git checkout master"
alias gcod="git checkout devel"
#alias gb="git branch"
__gitshortcut  gb       branch
#alias gm="git merge"
__gitshortcut  gm       merge
#alias gs="git status"
__gitshortcut  gs       status
#alias gd="git diff"
__gitshortcut  gd       diff
#alias ga="git add"
__gitshortcut  ga       add
#alias gf="git fetch"
__gitshortcut  gf       fetch
#alias gr='git reset'
__gitshortcut  gr       reset
#alias gst="git stash"
__gitshortcut  gst      stash
alias gstp="git stash pop"
alias gmm="git merge master"
alias gmd="git merge devel"
alias grs="git reset --soft"
alias grh="git reset --hard"

# Ruby
alias gel="gem list"


# Rails
alias ss="script/server -u "
alias sc="script/console"
alias sg='script/generate'

alias rs="rails server -u"
alias rc="rails console"
alias bi="bundle install"

alias mi="rake db:migrate"
alias mir="rake db:migrate:redo"
alias rsp="rake spec"

function rcf(){
  rake cucumber FEATURE=$1
}
function rcfjs(){
  rake cucumber:js FEATURE=$1
}
function rsp(){
  rake spec SPEC=$1
}

#helpers
alias gem_uninstall_all="gem list | cut -d\" \" -f1 | xargs gem uninstall -aIx" 
alias x="exit"

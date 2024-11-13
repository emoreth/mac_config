#!/bin/sh
alias ll="ls -lah"

source /etc/profile.d/bash_completion.sh
#source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#_completion_loader git



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

__gitshortcut () {
    type _git_$2_shortcut &>/dev/null || __define_git_completion $1 $2
    alias $1="git $2 $3"
    complete -o default -o nospace -F _git_$2_shortcut $1
}



# GIT
alias gda="git branch | grep -v "master" | xargs git branch -d"
alias gDa="git branch | grep -v "master" | xargs git branch -D"
#alias gp="git push"
__gitshortcut  gp       push
__gitshortcut  gpu       push -u
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
alias gapf="git commit --amend --no-edit -n  && git push -f"
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
alias gfp="git fetch --prune"
#alias gr='git reset'
__gitshortcut  gr       reset
#alias gst="git stash"
__gitshortcut  gst      stash
alias gstp="git stash pop"
alias gmm="git merge master"
alias gmd="git merge devel"
alias grs="git reset --soft"
alias grh="git reset --hard"

alias ghfs="git hub-feature start"
alias ghfu="git hub-feature update"
alias ghfp="git hub-feature publish"
alias ghfr="git hub-feature review"
alias ghff="git hub-feature finish"
alias gstrp="echo '======= Stashing... =======' && gst && echo '======= PULL Rebasing... =======' && glr && echo '======= Stash Popping... =======' && gstp"
alias gcop="gco pm-develop"
alias gmp="gm pm-develop"
#alias hpr="hub pull-request -a emoreth"
alias ppr="gp && hpr && pr"


alias jsonexplore="echo '' | fzf --print-query --preview \"cat *.json | jq {q}\""

# Hub pull request
function hpr() {
  FILE=`pwd`/.reviewers
  echo $FILE
  if [ -f $FILE ]; then
    hub pull-request -a emoreth -r `cat $FILE`
  else
    hub pull-request -a emoreth
  fi
}

# Ruby
alias gel="gem list"

# Circle CI
function ci() {
    open https://circleci.com/gh/carta/workflows/$(basename `git rev-parse --show-toplevel`)/tree/$(echo $(git rev-parse --abbrev-ref HEAD) | sed 's/\//%2F/g')
}

function pr() {
    open $(hub pr list -h  "$(git rev-parse --abbrev-ref HEAD)" -f "%i %t -> %U%n" | grep -E "http.+" -o)
}

# Django
alias mr="./manage.py runserver_plus --print-sql"
alias mm="./manage.py migrate"
alias mkm="./manage.py makemigrations"
alias ms="./manage.py shell_plus --print-sql"
alias mt="./manage.py test"
alias mtk="./manage.py test -k"
alias pytest="pytest --spec"
alias pu="pytest --spec ./tests/unit"

# Postgres
alias plog="> /usr/local/var/postgresql@9.6/pg_log/postgresql.log && tail -f /usr/local/var/postgresql@9.6/pg_log/postgresql.log"

# Docker
alias dka='docker kill $(docker ps -q)'
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dr="./bin/run "
alias drmm="./bin/run ./manage.py migrate"
alias dms="./bin/run ./manage.py shell_plus --print-sql"
alias drmkm="./bin/run ./manage.py makemigrations"
alias dc="./bin/compose "
alias dcl="./bin/compose local "
alias dclu="./bin/compose local up"
alias dcld="./bin/compose local down"
alias dclb="./bin/compose local build"
alias dclbn="./bin/compose local build --no-cache"
alias dcbb="./bin/compose base build"
alias dcbbn="./bin/compose base build --no-cache"
alias dta="./bin/run 'isort -rc eshares/ boardroom/ && pytest --cov-branch --cov --cov-report=html --cov-fail-under=90'"

# Rails
alias ss="script/server -u "
alias sc="script/console"
alias sg='script/generate'

alias rs="rails server -u"
alias rc="rails console"
alias rg="rails generate"
alias rgm="rails generate migration"
alias bi="bundle install"

alias srg="spring rails generate"
alias srgm="spring rails generate migration"
alias srs="spring rails server"
alias src="spring rails console"

alias zrs="zeus server"
alias zrc="zeus console"

alias mi="rake db:migrate"
alias mir="rake db:migrate:redo"
alias rsp="rake spec"

alias rr="rake routes"
alias srr="spring rake routes"

alias smi="spring rake db:migrate"
alias smir="spring rake db:migrate:redo"
alias srsp="spring rake spec"

alias zmi="zeus rake db:migrate"
alias zmir="zeus rake db:migrate:redo"
alias zrsp="zeus rake spec"


# Kubernetes
alias k="kubectl"
alias kg="kubectl get"
alias kx="kubectx"
alias ks="kubens"
alias kgp="k get pods"
alias kgpy="k get pods -o yaml"
alias kgs="k get services"
alias kgsy="k get services -o yaml"
alias kgd="k get deployments"
alias kgdy="k get deployments -o yaml"
alias kge="kubectl get events --sort-by=.metadata.creationTimestamp "
alias kdp="k delete pod --wait=0 "

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

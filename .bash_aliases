alias ll="ls -lah"

# GIT
alias gp="git push"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpod="git push origin devel"
alias gl="git pull"
alias glo="git pull origin"
alias glom="git pull origin master"
alias glod="git pull origin devel"
alias glr="git pull --rebase"
alias glro="git pull --rebase origin"
alias glrom="git pull --rebase origin master"
alias glrod="git pull --rebase origin devel"
alias gc="git commit"
alias gca='git commit -a'
alias gco="git checkout"
alias gcom="git checkout master"
alias gcod="git checkout devel"
alias gb="git branch"
alias gm="git merge"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gf="git fetch"
alias gr='git reset'
alias gst="git stash"
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

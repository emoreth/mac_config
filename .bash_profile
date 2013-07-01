source /Users/emoreth/.bash_aliases

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export CLICOLOR=true
export LSCOLORS=Exfxcxdxbxegedabagacad
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILESIZE=2000000

parse_svn_url() {
  /usr/bin/svn info 2> /dev/null | grep -E "^U(\w|:| )+(\/{2})(\w|\.)+" | sed -E s/.+\\\/{2}\(\\\w\|\\\.\)+/@svn:/
}

parse_git_branch() {
  git branch 2> /dev/null | grep -E "^\*.+" | sed -e '/^[^*]/d' -e 's/* \(.*\)/@git:\1/'

}

parse_rvm() {
  ~/.rvm/bin/rvm-prompt i v g
}

PS1='\[\033[0;33m\]`parse_rvm` # \w`parse_svn_url``parse_git_branch`/\[\033[0;37m\]\n\[\033[01;32m\]\u@\h\[\033[00m\]:\$ '


[[ -s "/Users/emoreth/.rvm/scripts/rvm" ]] && source "/Users/emoreth/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi


# MacPorts Installer addition on 2012-02-03_at_17:44:04: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


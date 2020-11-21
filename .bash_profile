source "$HOME/.bash_aliases"
source "$HOME/.bash_helm"
source "$HOME/.bash_aws"

export CLICOLOR=true
export LSCOLORS=Exfxcxdxbxegedabagacad
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILESIZE=2000000

export COMPOSE_DOCKER_CLI_BUILD=1 # improves cache hits by using the CLI docker for building
export DOCKER_BUILDKIT=1 # improves build speed by using docker's buildkit engine


parse_svn_url() {
  /usr/bin/svn info 2> /dev/null | grep -E "^U(\w|:| )+(\/{2})(\w|\.)+" | sed -E s/.+\\\/{2}\(\\\w\|\\\.\)+/@svn:/
}

parse_git_branch() {
  git branch 2> /dev/null | grep -E "^\*.+" | sed -e '/^[^*]/d' -e 's/* \(.*\)/@git:\1/'

}

parse_rvm() {
  ~/.rvm/bin/rvm-prompt i v g
}

PS1='\[\033[0;33m\] # \w`parse_git_branch`/\[\033[0;37m\]\n\[\033[01;32m\]\u@\h\[\033[00m\]:\$ '
#PS1='\[\033[0;33m\]`parse_git_branch`/\[\033[0;37m\]\n\[\033[01;32m\]\u@\h\[\033[00m\]:\$ '


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"



test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

eval "$(rbenv init -)"


export PATH="/usr/local/opt/node@10/bin:$PATH"


# MacPorts Installer addition on 2012-02-03_at_17:44:04: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


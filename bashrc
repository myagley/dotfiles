export PATH=$HOME/bin:/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export ARCHFLAGS='-arch i386 -arch x86_64'

export EDITOR="mvim -v"
alias vim="mvim -v"

# Virtualenv
export WORKON_HOME=~/.virtualenv
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
if [ -e /usr/local/bin/virtualenvwrapper.sh ]
then
  source /usr/local/bin/virtualenvwrapper.sh
fi

# PostgreSQL
export PATH=/Library/PostgreSQL/9.0/bin:$PATH
export PGDATA=/Library/PostgreSQL/9.0/data

# Scala
export SCALA_HOME=/usr/local/scala
export PATH=$PATH:$SCALA_HOME/bin

# HBase
export HBASE_HOME=/usr/local/hbase
export PATH=$HBASE_HOME/bin:$PATH

# Java
export JAVA_HOME=`/usr/libexec/java_home`

# Node
export NODE_PATH=/usr/local/lib/node
export PATH=$PATH:/usr/local/share/npm/bin

# Clojure
export CLOJURE_HOME=/usr/local/clojure
export PATH=$PATH:$CLOJURE_HOME/bin

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Prompt
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\w\$(parse_git_branch) $ "

# TempoDB SSH
function ssh-sea01 () {
  ssh $1.sea01.staging.tdb
}

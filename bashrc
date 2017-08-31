export PATH=$HOME/bin:/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export ARCHFLAGS='-arch i386 -arch x86_64'

# Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [[ $OSTYPE == 'darwin12' ]]; then
  alias vim="mvim -v"
fi
export EDITOR="vim"

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

# Maven
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m"

# Haskelll
export PATH=$HOME/.cabal/bin:$PATH

# Cloudbees
export BEES_HOME=/usr/local/cloudbees
export PATH=$PATH:$BEES_HOME

# golang
export GOPATH=$HOME/Code/golang

# rust
export PATH=$PATH:~/.cargo/bin


# alias mvn="color_maven"
# alias maven="/usr/local/bin/mvn"
# 
# color_maven() {
#   local BOLD=`tput bold`
#   local TEXT_RED=`tput setaf 1`
#   local TEXT_GREEN=`tput setaf 2`
#   local TEXT_YELLOW=`tput setaf 3`
#   local TEXT_PURPLE=`tput setaf 5`
#   local TEXT_WHITE=`tput setaf 7`
#   local RESET_FORMATTING=`tput sgr0`
# 
#   maven $@ | sed -e "s/\\(\\[INFO\\]\\ \\-\\-\\-\\ .*\\)/${TEXT_BLUE}\\1${RESET_FORMATTING}/g" \\
#     -e "s/\\(\\[INFO\\]\\ \\[.*\\)/${RESET_FORMATTING}\\1${RESET_FORMATTING}/g" \\
#     -e "s/\\(\\[INFO\\]\\ \\)\\(BUILD SUCCESS\\)/\\1${TEXT_GREEN}\\2${RESET_FORMATTING}/g" \\
#     -e "s/\\(\\[INFO\\]\\ \\)\\(BUILD FAILURE\\)/\\1${TEXT_RED}\\2${RESET_FORMATTING}/g" \\
#     -e "s/\\(.WARNING.*\\)/${TEXT_YELLOW}\\1${RESET_FORMATTING}/g" \\
#     -e "s/\\(\\[ERROR\\]\\)/${TEXT_RED}\\1${RESET_FORMATTING}/g" \\
#     -e "s/\\(\\[debug\\]\\)/${TEXT_PURPLE}\\1${RESET_FORMATTING}/g" \\
#     -e "s/\\(Exception in thread \\".*\\" \\)\\(.*\\)/\\1${TEXT_RED}\\2${RESET_FORMATTING}/g" \\
#     -e "s/\\(SUCCESS \\)\\[/${RESET_FORMATTING}${TEXT_GREEN}\\1${RESET_FORMATTING}\\[/g" \\
#     -e "s/\\(FAILURE \\)\\[/${RESET_FORMATTING}${TEXT_RED}\\1${RESET_FORMATTING}\\[/g" \\
#     -e "s/\\(Caused by: \\)\\([^:\\t ]*\\)/\\1${TEXT_RED}\\2${RESET_FORMATTING}/g" \\
#     -e "s/\\(ERROR\\ \\[.*\\)/${TEXT_RED}\\1${RESET_FORMATTING}/g" \\
#     -e "s/Tests run: \\([^,]*\\), Failures: \\([^,0]*\\), Errors: \\([^,]*\\), Skipped: \\([^,]*\\)/${TEXT_GREEN}Tests run: \\1${RESET_FORMATTING}, Failures: ${TEXT_RED}\\2${RESET_FORMATTING}, Errors: ${TEXT_RED}\\3${RESET_FORMATTING}, Skipped: ${TEXT_YELLOW}\\4${RESET_FORMATTING}/g"
# 
#   echo -ne ${RESET_FORMATTING}
# }

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

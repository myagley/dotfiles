# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"
ZSH_THEME="wuffers"
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
compleat
gem
git
vagrant
django
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=$HOME/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export ARCHFLAGS='-arch i386 -arch x86_64'

export EDITOR="mvim -v"
alias vim="mvim -v"

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

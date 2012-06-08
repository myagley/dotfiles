export PATH=$HOME/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export ARCHFLAGS='-arch i386 -arch x86_64'

# PostgreSQL
export PATH=/Library/PostgreSQL/9.0/bin:$PATH
export PGDATA=/Library/PostgreSQL/9.0/data

# Scala
export SCALA_HOME=/usr/local/scala
export PATH=$PATH:$SCALA_HOME/bin/

# HBase
export HBASE_HOME=/usr/local/hbase
export PATH=$HBASE_HOME/bin/:$PATH

# Java
export JAVA_HOME=`/usr/libexec/java_home`

# Node
export NODE_PATH=/usr/local/lib/node
export PATH=$PATH:/usr/local/share/npm/bin

# Clojure
export CLOJURE_HOME=/usr/local/clojure
export PATH=$PATH:$CLOJURE_HOME/bin/

#!/bin/zsh
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GO15VENDOREXPERIMENT=1
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin
export SCALA_HOME=/usr/local/share/scala
export PATH=$PATH:$SCALA_HOME/bin
export SBT_HOME=/usr/local/share/sbt
export PATH=$PATH:$SBT_HOME/bin
export PATH=$PATH:/usr/local/share/idea/bin
export PATH=$PATH:/usr/local/share/dotnet
if [ -e $HOME/.zshenv_local ]
then
  source $HOME/.zshenv_local
fi


export PATH="$HOME/.cargo/bin:$PATH"

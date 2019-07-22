#!/bin/zsh
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
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
export GROOVY_HOME=/usr/local/opt/groovy/libexec
if [ -e $HOME/.zshenv_local ]
then
  source $HOME/.zshenv_local
fi

# macos zsh load_profile workaround
source $HOME/.zshenv


export PATH="$HOME/.cargo/bin:$PATH"
alias rake='noglob rake'

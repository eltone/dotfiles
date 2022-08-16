ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)

source "${HOME}/.zgenom/zgen.zsh"

if ! zgen saved; then
    echo 'saving zgen conf'
    zgen prezto

    # prezto options
    zgen prezto editor key-bindings 'emacs'
    zgen prezto prompt theme 'sorin'
    zgen prezto '*:*' color 'yes'

    # prezto and modules

    if [ "$(uname -s 2> /dev/null)" = "Darwin" ]; then
      echo 'loading macos specific plugins'
      zgen prezto osx
    fi

    zgen prezto git
    zgen prezto command-not-found
    zgen prezto syntax-highlighting
    zgen prezto tmux
    zgen prezto docker
    zgen prezto history
    zgen prezto directory
    zgen prezto prompt
    zgen prezto history-substring-search

    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-completions src
    zgen load superbrothers/zsh-kubectl-prompt

    zgen prezto completion
    zgen save
fi

autoload -U colors; colors

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
autoload -U compinit
compinit -C

RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

alias k=kubectl

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshenv_local ] && source ~/.zshenv_local
eval "$(zoxide init zsh)"


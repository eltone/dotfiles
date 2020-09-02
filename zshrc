ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    echo 'saving zgen conf'
    zgen prezto

    # prezto options
    zgen prezto editor key-bindings 'emacs'
    zgen prezto prompt theme 'sorin'
    zgen prezto '*:*' color 'yes'

    # prezto and modules
    zgen prezto git
    zgen prezto command-not-found
    zgen prezto syntax-highlighting
    zgen prezto tmux
    zgen prezto ruby
    zgen prezto docker
    zgen prezto history
    zgen prezto directory
    zgen prezto completion
    zgen prezto prompt
    zgen prezto history-substring-search

    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-completions src

    zgen save
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"

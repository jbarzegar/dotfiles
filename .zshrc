#!/bin/bash
#
# aliases
alias vi="nvim"
alias vim="nvim"
alias reload="source ~/.zshrc"
export EDITOR="nvim"


eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/pure.omp.json)"
eval "$(mise activate zsh)"

[ -s "/Users/james/.scm_breeze/scm_breeze.sh" ] && source "/Users/james/.scm_breeze/scm_breeze.sh"
eval "$(zoxide init zsh)"

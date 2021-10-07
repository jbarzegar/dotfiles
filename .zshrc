export VISUAL="nvim"
export EDITOR="nvim"
export GIT_EDITOR="$EDITOR"

# Source Prezto.
#[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ] && source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Load scm_breeze
#[ -s "/Users/james/.scm_breeze/scm_breeze.sh" ] && source "/Users/james/.scm_breeze/scm_breeze.sh"

#alias
alias cls="clear"
alias reload="clear && source $HOME/.zshrc"
alias yw="yarn workspace"

######## VIM ########
alias vi="nvim"
alias vim="nvim"
#alias vianger='vim -c "Ranger"'
#alias vifzf='vim -c "FZF"'

# git
alias gpsf="git push --force-with-lease"

# Load dev secrets
. ~/.config/shell/.secrets

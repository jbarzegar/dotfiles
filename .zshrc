export VISUAL="nvim"
export EDITOR="nvim"
export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:~/.bin:/Applications/Postgres.app/Contents/Versions/latest/bin
export GIT_EDITOR="$EDITOR"
export PGHOST=localhost
export GOPATH=$HOME/go

# Source Prezto.
[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ] && source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# Load scm_breeze
[ -s "/Users/james/.scm_breeze/scm_breeze.sh" ] && source "/Users/james/.scm_breeze/scm_breeze.sh"
# Load nvm
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#alias
alias cls="clear"
alias reload="clear && source ~/.zshrc"
alias yw="yarn workspace"
alias cask="brew cask"
alias reload_wm="launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai""
alias google="googler -n 5"
alias wrk="wrk -c 1 -t 1"

######## VIM ########
alias vi="nvim"
alias vim="nvim"
alias vianger='vim -c "Ranger"'
alias vifzf='vim -c "FZF"'

# git
alias gpsf="git push --force-with-lease"

######## For on call #######
alias on_call_console="heroku run -a policy-admin-production rails c"


eval "$(rbenv init -)"

# Load dev secrets
. ~/.config/shell/.secrets

export DISABLE_SPRING=true

# fnm
eval "$(fnm env --multi)"

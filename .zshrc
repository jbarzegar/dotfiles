POSTGRES_VERSION=10

export VISUAL="nvim"
export EDITOR="nvim"
export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export GIT_EDITOR="$EDITOR"
export PGHOST="localhost"
export GOPATH=$HOME/go
export DENO_INSTALL="/Users/James/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export PATH=$PATH:$GOPATH:$HOME/.bin

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
function __run_on_call_console() {
	heroku run -a policy-admin-production rails console production
}
alias on_call_console="~/.bin/open-iterm.sh __run_on_call_console"


eval "$(rbenv init -)"

# Load dev secrets
. ~/.config/shell/.secrets

export DISABLE_SPRING=true

# fnm
eval "$(fnm env --multi)"

if ! yadm diff-index --quiet HEAD --; then
	echo "🚨 Yadm has uncommited changes: run 'yadm status'"
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

######## editor ########
export VISUAL="emacsclient -n -c -a emacs"
export EDITOR="emacsclient -t"

alias edit="$VISUAL"

alias vi="nvim"
alias vim="nvim"


export GIT_EDITOR="$EDITOR"
export LESS=' -R '


# Source Prezto.
if [ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
else
	echo "installing zprezto"
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi


#alias
alias cls="clear"
alias reload="clear && source $HOME/.zshrc"
alias yw="yarn workspace"

# git
alias gpsf="git push --force-with-lease"

# use current branch instead
alias gps="git-push-current-branch"

# Load dev secrets
#
[ -s "$HOME/.config/.secrets" ] && source "$HOME/.config/.secrets"
#. ~/.config/shell/.secrets

# fnm
export PATH=/home/james/.fnm:$PATH
eval "`fnm env`"


SCM_BREE_DIR="$HOME/.scm_breeze/scm_breeze.sh"

if [ -s "/home/james/.scm_breeze/scm_breeze.sh" ]; then 
	source "$SCM_BREE_DIR"
else
	git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
	~/.scm_breeze/install.sh
fi

alias disable_getty="sudo systemctl disable getty@tty2.service"

export PATH=$HOME/.emacs.d/bin:$PATH

doom env

# THIS ALWAYS AT THE BOTTOM
clear && dab 

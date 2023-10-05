# load zprof
zmodload zsh/zprof

# Make sure to have homebrew bins if installed
which brew > /dev/null
BREW_RESULT=$?

# Profiling script
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# TMUX
# User configuration
# Always work in a tmux session if tmux is installed
# https://github.com/chrishunt/dot-files/blob/master/.zshrc
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux -f "$HOME/.config/tmux/tmux.conf" attach -t hack || tmux new -s hack; exit
  fi
fi

if [ "$TMUX" = "" ]; then 
  bindkey -s '^f' 'tmux-sessionizer\n'
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if [ -d "$HOME/Library/Python/3.8/bin/" ]; then
   export PATH=$HOME/Library/Python/3.8/bin:$PATH
fi

# NVM
 if [ $BREW_RESULT -eq 0 ] ; then
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
 fi
 
 if [[ -r "/usr/share/nvm/init-nvm.sh" ]]; then
 source /usr/share/nvm/init-nvm.sh
 fi

export NODE_PATH=$NODE_PATH:`npm root -g`

# Java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export PATH="/usr/local/sbin:$HOME/.local/bin:$PATH"
alias vim="nvim"


export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

if [ -f ~/go ]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

# Kubectl Functions
# ---
#
alias k="kubectl"
alias h="helm"

kn() {
    if [ "$1" != "" ]; then
	    kubectl config set-context --current --namespace=$1
    else
	    echo -e "\e[1;31m Error, please provide a valid Namespace\e[0m"
    fi
}

knd() {
    kubectl config set-context --current --namespace=default
}

ku() {
    kubectl config unset current-context
}

if [ -f ~/.config/sops/age/keys.txt ]; then
  export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
fi

export GPG_TTY=$(tty)

source /opt/homebrew/opt/spaceship/spaceship.zsh

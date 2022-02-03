which brew > /dev/null
BREW_RESULT=$?
if [ $BREW_RESULT -eq 0 ]; then
  export PATH=$(brew --prefix)/bin:$PATH
   export PATH=$(brew --prefix)/sbin:$PATH
fi

alias tmux="TERM=xterm-256color tmux"
export TERM=screen-256color
if [ "$TMUX" = "" ]; then tmux; fi

if [ -f /opt/homebrew/bin/brew ]; then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=/opt/homebrew/sbin:$PATH
fi

alias tmux="TERM=xterm-256color tmux"
export TERM=screen-256color
if [ "$TMUX" = "" ]; then tmux; fi

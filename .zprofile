alias tmux="TERM=xterm-256color tmux"
export TERM=screen-256color
if [ "$TMUX" = "" ]; then tmux; fi

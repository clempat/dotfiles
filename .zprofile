# TODO find a better way to detect brew
export BREW_PATH="/opt/homebrew"

if [ -d "$BREW_PATH/bin" ]; then
   export PATH=$BREW_PATH/bin:$PATH
   export PATH=$BREW_PATH/sbin:$PATH
fi

alias tmux="TERM=xterm-256color tmux"
export TERM=screen-256color
if [ "$TMUX" = "" ]; then tmux; fi

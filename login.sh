#!/bin/sh

if [ -z "$TMUX" ]; then
  tmux ls | grep 'weechat' > /dev/null || (
  	tmux new-session -d -s 'weechat' -n 'weechat-curses'
)
  exec tmux attach -t 'weechat'
fi

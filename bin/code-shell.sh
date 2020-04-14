#!/bin/sh
# See: https://medium.com/@joaomoreno/persistent-terminal-sessions-in-vs-code-8fc469ed6b41
SESSION="vscode`pwd | md5`"
tmux attach-session -d -t $SESSION || tmux new-session -s $SESSION
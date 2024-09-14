# tmux

## Enable scrolling with a mouse
```
tmux set -g mouse on
```

## Disable scrolling with a mouse
```
tmux set -g mouse off
```

## List active sessions
```
tmux ls
```

## Create a detached session
```
tmux new-session -d -s minecraft_server
```

## Create a detached session and run a command in it
```
tmux new-session -d -s minecraft_server './start_server.sh'
```

## Attach to a detached session
```
tmux attach -t minecraft_server
```
OR
```
tmux a -t minecraft_server
```

## Send commands to a detached session
[Run command in detached tmux session](https://serverfault.com/a/339451)
```
tmux send -t minecraft_server "ls -la" ENTER
```

## Detach from a session
<kbd>CTRL</kbd>+<kbd>B</kbd> then <kbd>D</kbd>

## Disable the status bar
[Disable the status bar in tmux?](https://superuser.com/a/265324)
```
tmux set -g status off
```

## Enable the status bar
```
tmux set -g status on
```

## Kill a specific session
```
tmux kill-session -t [session-name]
```

## Kill all tmux sessions
```
tmux kill-server
```

## Create a new pane to the right
<kbd>CTRL</kbd>+<kbd>B</kbd> then <kbd>%</kbd>

## Create a new pane below
<kbd>CTRL</kbd>+<kbd>B</kbd> then <kbd>"</kbd>

## Switch between panes
<kbd>CTRL</kbd>+<kbd>B</kbd> then <kbd>←</kbd>

<kbd>CTRL</kbd>+<kbd>B</kbd> then <kbd>→</kbd>

## Close a pane
```
exit
```

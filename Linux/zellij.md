# Zellij

[zellij GitHub page](https://github.com/zellij-org/zellij)

### Exit zellij
<kbd>Ctrl</kbd> + <kbd>Q</kbd>

---

# Tabs

### Open a new tab
<kbd>Ctrl</kbd> + <kbd>T</kbd>, <kbd>N</kbd>

### Cycle through tabs
<kbd>Ctrl</kbd> + <kbd>T</kbd> then use the arrow keys

---

# Panes

### Open a new pane
<kbd>Ctrl</kbd> + <kbd>P</kbd>, <kbd>N</kbd>

### Open a new horizontal pane
<kbd>Ctrl</kbd> + <kbd>P</kbd>, <kbd>D</kbd>

### Open a new vertical pane
<kbd>Ctrl</kbd> + <kbd>P</kbd>, <kbd>R</kbd>

### Highlight a different pane
<kbd>Ctrl</kbd> + <kbd>P</kbd> then use the arrow keys

---

# Sessions

### List all sessions
```
$ zellij ls
profound-panda [Created 5h 50m 57s ago] (EXITED - attach to resurrect)
sparkling-cymbal [Created 0s ago]
```

### Attach to a session
```
$ zellij a profound-panda
```
OR
```
$ zellij attach profound-panda
```

### Detach from your session
<kbd>Ctrl</kbd> + <kbd>O</kbd>, <kbd>D</kbd>

### Open the session manager
<kbd>Ctrl</kbd> + <kbd>O</kbd>, <kbd>W</kbd>

### Kill a session
```
$ zellij k profound-panda
```

### Kill exited sessions
```
$ zellij delete-all-sessions
```

### Kill all sessions
```
$ zellij ka
```

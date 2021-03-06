# `screen` Usage:

### Start a new screen session:
```
screen
```
or
```
screen -s LongDownload
```

### List all screen sessions:
```
screen -ls
```

### Attach to a screen session:
```
screen -r {screen_id_here}
```
Example:
```
screen -r 6438
```
or
```
screen -r LongDownload
```

### Detach from a screen session:
<kbd>Ctrl</kbd>+<kbd>A</kbd> then <kbd>D</kbd>

### Kill an existing detached screen session:
[Source](https://stackoverflow.com/a/1509764)
```
screen -XS {screen_id_here} quit

Example:
screen -XS 6438 quit
```

### View history of a screen session over SSH:
To view screen session history you have to enter copy mode which can be done by pressing <kbd>Ctrl</kbd>+<kbd>A</kbd> then <kbd>Esc</kbd> then using the up and down arrows to navigate the history. Pressing <kbd>Esc</kbd> again will exit copy mode and allow you to type normally again.

### Increase scrollback buffer of attached session:
[Source](https://stackoverflow.com/a/8760452)

Press <kbd>Ctrl</kbd>+<kbd>A</kbd> then <kbd>:</kbd> and then type
```
scrollback 10000
```

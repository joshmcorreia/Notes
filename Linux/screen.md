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

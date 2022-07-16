# Terminal shortcuts:

### Quit a process:
NOTE: This sends a `SIGINT` signal<br>
<kbd>CTRL</kbd> + <kbd>C</kbd>

### Suspend a process:
NOTE: This sends a `SIGTSTP` signal<br>
<kbd>CTRL</kbd> + <kbd>Z</kbd>

### Restore a suspended process: ([Source](https://unix.stackexchange.com/a/45029/340031))<br>
```
jobs

fg %1 (replace this number with the process that returns from the `jobs` command)
```

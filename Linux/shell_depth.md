# Shell Depth:

### Figure out how many shells deep you are:
[Source](https://unix.stackexchange.com/a/373713)<br>
Note: Returns 1 in the base shell, and increments by one for each additional shell that you get into. `ssh` will not increment this number and the new session has its own values.
```
echo $SHLVL
```

### Print out the process id of the current shell:
```
echo $$
```

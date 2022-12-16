# grep

## Highlight search options
[More color options explained](https://askubuntu.com/a/1042242)

macOS:
```
export GREP_OPTIONS='--color=auto' GREP_COLOR='0;39;101'
```

Linux:
```

```

## Case sensitive search
```
$ echo "josh\nJosh\nJOSH" | grep josh
josh
```

## Case insensitive search
```
$ echo "josh\nJosh\nJOSH" | grep -i josh
josh
Josh
JOSH
```

## Search for full words instead of sub-strings
```
$ echo "josh\njoshua" | grep -w josh
josh
```

## Search for a string in a single file
```
grep word filename.txt
```

Example:
```
$ grep 1 one_through_ten.txt
1
10
```

## Search for a string in multiple files
```
grep string FILE_PATTERN
```

Example:
```
$ grep 1 number*
number_1.txt:1
number_10.txt:10
```

## Recursively search for a string in the specified directory
```
# search the current directory
# Note: I've noticed this is 25x faster than the specified directory search, unsure why at the moment
grep -r string *

# search a specified directory
grep -r string /home/josh
```

## Search the process table
```
ps auxww | grep ssh
```
Example:
```
$ ps auxww | grep ssh
josh              1264   0.0  0.0 33637388    616   ??  S    28Nov22   0:03.29 /usr/bin/ssh-agent -l
josh             89929   0.0  0.0 34252380    732 s002  S+   11:21AM   0:00.00 grep ssh
josh             80362   0.0  0.0 34293232   2944 s004  S+    9:42AM   0:00.26 ssh josh@192.168.0.1
```

## Search the process table and exclude the grep process
[How can I prevent 'grep' from showing up in ps results?](https://unix.stackexchange.com/a/74186)
```
ps auxww | grep "[s]sh"
```
Example:
```
$ ps auxww | grep "[s]sh"
josh              1264   0.0  0.0 33637388    616   ??  S    28Nov22   0:03.29 /usr/bin/ssh-agent -l
josh             80362   0.0  0.0 34293232   2944 s004  S+    9:42AM   0:00.26 ssh josh@192.168.0.1
```

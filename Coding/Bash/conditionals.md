# Bash Conditionals

## Check if a variable is equal to an integer
``` bash
age=23
if [ "$age" -eq 23 ]; then echo "Nobody likes you when you're 23"; fi
```

## Check if a variable is not equal to an integer
``` bash
age=23
if [ "$age" -ne 23 ]; then echo "You're not even 23"; fi
```

## Check if a variable is equal to a string
[Source](https://stackoverflow.com/a/2237103)
``` bash
name="josh"
if [ "$name" = "josh" ]; then echo "Hello Josh"; fi
> Hello Josh
```

## Check if a variable is not equal to a string
``` bash
name="john"
if [ "$name" != "josh" ]; then echo "Hello not-Josh"; fi
> Hello not-Josh
```

## Combining multiple if statements
[Source](https://stackoverflow.com/a/23543261)
``` bash
first="josh"
last="correia"
if [[ "$first" = "josh" && "$last" = "correia" ]]; then echo "Hello Josh Correia"; fi
> Hello Josh Correia
```

## Check if arguments were provided
[Source](https://stackoverflow.com/a/6482403)
```
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
fi
```

## Check if a file exists
[Source](https://stackoverflow.com/a/638980)
```
if [ -f /tmp/foo.txt ]; then
    echo "File found!"
fi
```

## Check if a file does not exist
[Source](https://stackoverflow.com/a/638980)
```
if [ ! -f /tmp/foo.txt ]; then
    echo "File not found!"
fi
```

## Check if a command exists
[Source](https://stackoverflow.com/a/26759734)
```
if [ -x "$(command -v git)" ]; then
  echo "'git' is installed" >&2
fi
```

## Check if a command does not exist
[Source](https://stackoverflow.com/a/26759734)
```
if ! [ -x "$(command -v git)" ]; then
  echo "Error: 'git' is not installed." >&2
  exit 1
fi
```

## Check if the sudo password has been entered for a terminal session
[Source](https://askubuntu.com/a/357222)
```
if sudo -n true 2>/dev/null; then 
    echo "I got sudo"
else
    echo "I don't have sudo"
fi
```

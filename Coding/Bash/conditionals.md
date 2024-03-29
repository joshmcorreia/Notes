# Bash Conditionals

## Check if a variable is equal to a specific integer
``` bash
age=23
if [ "$age" -eq 23 ]; then echo "Nobody likes you when you're 23"; fi
```

## Check if a variable is not equal to a specific integer
``` bash
age=23
if [ "$age" -ne 23 ]; then echo "You're not even 23"; fi
```

## Check if a variable is less than a specific integer
``` bash
age=22
if [ "$age" -lt 23 ]; then echo "You're not even 23 yet"; fi
```

## Check if a variable is less than or equal to a specific integer
``` bash
age=22
if [ "$age" -le 22 ]; then echo "You're not even 23 yet"; fi
```

## Check if a variable is greater than a specific integer
``` bash
age=24
if [ "$age" -gt 23 ]; then echo "You're older than 23"; fi
```

## Check if a variable is greater than or equal to a specific integer
``` bash
age=24
if [ "$age" -ge 24 ]; then echo "You're older than 23"; fi
```

## Check if a variable is an integer
[How do I test if a variable is a number in Bash?](https://stackoverflow.com/a/806923)
``` bash
re='^[0-9]+$'
if ! [[ $MY_NUMBER =~ $re ]] ; then
   echo "ERROR: Not a number"
   exit 1
fi
```

## Check if a variable is equal to a specific string
[Source](https://stackoverflow.com/a/2237103)
``` bash
name="josh"
if [ "$name" = "josh" ]; then echo "Hello Josh"; fi
> Hello Josh
```

## Check if a variable is not equal to a specific string
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
``` bash
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
fi
```

## Check if a file exists
[Source](https://stackoverflow.com/a/638980)
``` bash
if [ -f /tmp/foo.txt ]; then
    echo "File found!"
fi
```

## Check if a file does not exist
[Source](https://stackoverflow.com/a/638980)
``` bash
if [ ! -f /tmp/foo.txt ]; then
    echo "File not found!"
fi
```

## Check if a command exists
[Source](https://stackoverflow.com/a/26759734)
``` bash
if [ -x "$(command -v git)" ]; then
  echo "'git' is installed" >&2
fi
```

## Check if a command does not exist
[Source](https://stackoverflow.com/a/26759734)
``` bash
if ! [ -x "$(command -v git)" ]; then
  echo "Error: 'git' is not installed." >&2
  exit 1
fi
```

## Check if the sudo password has been entered for a terminal session
[Source](https://askubuntu.com/a/357222)
``` bash
if sudo -n true 2>/dev/null; then 
    echo "I got sudo"
else
    echo "I don't have sudo"
fi
```

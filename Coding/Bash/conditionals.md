# Bash Conditionals

## String Equality
[Source](https://stackoverflow.com/a/2237103)
``` bash
name="josh"
if [ "$name" = "josh" ]; then echo "Hello Josh"; fi
> Hello Josh
```

## Combining Multiple If Statements
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

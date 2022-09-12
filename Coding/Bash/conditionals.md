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

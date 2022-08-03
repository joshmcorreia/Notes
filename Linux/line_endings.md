# Line Endings

## Find all files with CRLF line endings:
[Source](https://stackoverflow.com/a/73969)
```
find . -not -type d -exec file "{}" ";" | grep CRLF
```

# Line Endings

## Find all files with CRLF line endings:
[Source](https://stackoverflow.com/a/73969)
```
find . -not -type d -exec file "{}" ";" | grep CRLF
```

## Convert a file from CRLF to LF line endings:
```
dos2unix file.txt
```
or if you need to convert an entire folder:
```
dos2unix my_folder/*
```

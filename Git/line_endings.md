## Git - Line Endings

## List all line endings using git:
[How to see what type of line endings are already in git repository?](https://stackoverflow.com/a/69402821)
```
git ls-files --eol
```

## Find all CRLF files using git:
[how to find crlf line separators with git?](https://stackoverflow.com/a/24604608)
```
git grep -Il $'\r'
```

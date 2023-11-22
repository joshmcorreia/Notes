# awk

## Print the Nth argument
**Note:** This is great when you have variable-length whitespace
```
$ echo "one two three four" | awk '{print $4}'
four

$ echo "one     two                       three    four" | awk '{print $4}'
four
```

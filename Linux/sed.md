# sed

## Replace lines containing a certain string
[Source](https://stackoverflow.com/a/11245501)
```
sed -i '/string_to_replace/c\This is the new line.' /tmp/foo
```

Example:
```
$ echo -e "This line will be replaced because it contains my password\n1\n2" > /tmp/foo
$ cat /tmp/foo
This line will be replaced because it contains my password
1
2
$ sed -i '/password/c\REDACTED' /tmp/foo
$ cat /tmp/foo
REDACTED
1
2
```

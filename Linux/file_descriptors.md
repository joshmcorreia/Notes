# File Descriptors

- std_in: `/dev/fd/0`
- std_out: `/dev/fd/1`
- std_err: `/dev/fd/2`


## Ignore std_out:
```
echo "hello" 1> /dev/null
```

## Ignore std_err:
```
rm non_existing_file.txt 2> /dev/null
```

## Redirect std_out to std_err:
```
echo "hello" 1>&2
```

## Redirect std_err to std_out:
```
echo "hello" 2>&1
```
or
```
echo "hello" &> # bash convention
```
[Source](https://tldp.org/LDP/abs/html/io-redirection.html)

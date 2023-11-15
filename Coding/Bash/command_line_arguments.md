## Positioned Parameters

## Flags
[Source](https://stackoverflow.com/a/21128172)
``` bash
a_flag=''
b_flag=''
files=''
verbose='false'

print_usage() {
  printf "Usage: ..."
}

while getopts 'abf:v' flag; do
  case "${flag}" in
    a) a_flag='true' ;;
    b) b_flag='true' ;;
    f) files="${OPTARG}" ;;
    v) verbose='true' ;;
    *) print_usage
       exit 1 ;;
  esac
done
```

---

## Access Arguments by Position
``` bash
#!/bin/bash
echo "First argument is '$1'"
echo "Second argument is '$2'"
```

```
$ ./test.sh first second
First argument is 'first'
Second argument is 'second'
```

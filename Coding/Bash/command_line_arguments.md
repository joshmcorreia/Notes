## Positioned Parameters

## Flags
[How do I parse command line arguments in Bash?](https://stackoverflow.com/a/14203146)
``` bash
#!/bin/bash

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -f|--first_name)
      FIRST_NAME="$2"
      shift # past argument
      shift # past value
      ;;
    -l|--last_name)
      LAST_NAME="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done
set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

echo "FIRST_NAME = '${FIRST_NAME}'"
echo "LAST_NAME = '${LAST_NAME}'"
```

Example executions:
```
$ ./test.sh
FIRST_NAME = ''
LAST_NAME = ''

$ ./test.sh -f josh -l correia
FIRST_NAME = 'josh'
LAST_NAME = 'correia'
```

[How to get arguments with flags in Bash](https://stackoverflow.com/a/21128172)
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

# Bash Trap

---

## Clean up on error
**NOTE**: This is only called if an **error** occurs.

[Bash: Exit and cleanup on error](https://stackoverflow.com/a/36335414)
``` bash
#!/bin/bash
set -e
clean_up () {
    exit_code=$?
    echo "Cleaning up 'garbage_file.txt'..."
    rm garbage_file.txt
    echo "Successfully cleaned up 'garbage_file.txt'."
    exit $exit_code
}
trap clean_up ERR

echo "Creating 'garbage_file.txt'..."
touch garbage_file.txt
echo "Successfully created 'garbage_file.txt'."
echo "Changing to an invalid directory..."
cd invalid_directory
echo "Successfully changed to an invalid directory."
```

Example execution:
```
$ ./test.sh
Creating 'garbage_file.txt'...
Successfully created 'garbage_file.txt'.
Changing to an invalid directory...
./test.sh: line 16: cd: invalid_directory: No such file or directory
Cleaning up 'garbage_file.txt'...
Successfully cleaned up 'garbage_file.txt'.
$ echo $?
1
```

---

## Clean up on exit
**NOTE**: This is called every time the script exits, regardless of what caused it to exit. This will preserve the exit code from when the trap was hit.

[Bash: Exit and cleanup on error](https://stackoverflow.com/a/36335414)
``` bash
#!/bin/bash
set -e
clean_up () {
    echo "Cleaning up 'garbage_file.txt'..."
    rm garbage_file.txt
    echo "Successfully cleaned up 'garbage_file.txt'."
}
trap clean_up EXIT

echo "Creating 'garbage_file.txt'..."
touch garbage_file.txt
echo "Successfully created 'garbage_file.txt'."
echo "Now the script is finished and exiting."
```

Example execution:
```
$ ./test.sh
Creating 'garbage_file.txt'...
Successfully created 'garbage_file.txt'.
Now the script is finished and exiting.
Cleaning up 'garbage_file.txt'...
Successfully cleaned up 'garbage_file.txt'.
$ echo $?
0
```

### Proof that the exit code is persistent
``` bash
#!/bin/bash
set -e
clean_up () {
    echo "Cleaning up 'garbage_file.txt'..."
    rm garbage_file.txt
    echo "Successfully cleaned up 'garbage_file.txt'."
}
trap clean_up EXIT

echo "Creating 'garbage_file.txt'..."
touch garbage_file.txt
echo "Successfully created 'garbage_file.txt'."
echo "Now the script is finished and exiting."

exit 123
```

Example execution:
```
$ ./test.sh
Creating 'garbage_file.txt'...
Successfully created 'garbage_file.txt'.
Now the script is finished and exiting.
Cleaning up 'garbage_file.txt'...
Successfully cleaned up 'garbage_file.txt'.
$ echo $?
123
```

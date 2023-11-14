## Check the username of the user running the script:
``` bash
if [ "$USER" != "root" ]; then
    echo "ERROR: This script must be run as root."
    exit 1
fi
```

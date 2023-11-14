# Using SSH via Bash

### Checking if you can connect to a server without a password
[How do I make ssh fail rather than prompt for a password if the public-key authentication fails?](https://serverfault.com/a/61936)
``` bash
echo "Verifying that we can connect to the server..."
ssh -o BatchMode=yes josh@obsidian.lan exit
test $? = 0 && echo Successfully connected to the server || echo Failed to connect to the server
```

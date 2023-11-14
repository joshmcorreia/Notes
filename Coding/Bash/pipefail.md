# Bash pipefail

## How do you catch error codes in a shell pipe?
In bash we can do the following:
``` bash
#!/bin/bash

set -e # exit on error
set -o pipefail
```

As per the [manpage](https://www.man7.org/linux/man-pages/man1/bash.1.html):
```
If pipefail is enabled, the pipeline's return status is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands exit successfully.
```

## Check the UID of the user running the script
```python3
import os
import sys

current_user_id = os.getuid()
root_user_id = 0
if current_user_id != root_user_id:
	print("ERROR: This script must be run as root")
	sys.exit(1)
```

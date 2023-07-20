## How to run shell commands
``` python3
from subprocess import Popen, PIPE

shell_command = "pip3 list"
capture = Popen(shell_command, stdout=PIPE, stderr=PIPE, shell=True)
std_out, std_err = capture.communicate()
if isinstance(std_err, bytes):
	std_err = std_err.decode().rstrip()
if isinstance(std_out, bytes):
	std_out = std_out.decode().rstrip()
return_code = capture.returncode
```

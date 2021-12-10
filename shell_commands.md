# How to run shell commands:

### Python3:
``` python
from subprocess import Popen, PIPE

shell_command = "pip3 list"
capture = Popen(shell_command, stdout=PIPE, stderr=PIPE, shell=True)
std_out, std_err = capture.communicate()
return_code = capture.returncode
```

### JavaScript:
Not applicable; JavaScript runs in a browser

### C# ([Source](https://stackoverflow.com/questions/1469764/run-command-prompt-commands)):
Note: This runs Command Prompt since C# runs on Windows systems. It's better to call libraries when possible.
``` csharp
System.Diagnostics.Process process = new System.Diagnostics.Process();
System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
startInfo.FileName = "cmd.exe";
startInfo.Arguments = "/C copy /b Image1.jpg + Archive.rar Image2.jpg";
process.StartInfo = startInfo;
process.Start();
```

### bash:
Everything is a shell command

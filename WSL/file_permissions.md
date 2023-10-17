# File Permissions

## Enabling linux file permissions in WSL
[Unable to change file permissions on Ubuntu Bash for Windows 10](https://superuser.com/a/1343737)
```
sudo vim /etc/wsl.conf
```
Paste the following into the file:
```
[automount]
options = "metadata"
```
Close all instances of WSL and relaunch a WSL terminal and your file permissions should work now.

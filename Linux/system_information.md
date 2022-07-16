# System information:

### Print out system information:
```
uname -a
```
OR
```
cat /etc/os-release
```
OR
```
lsb_release -a
```
OR
```
hostnamectl
```

### Print the kernel release:
```
uname -r
```

### Print the kernel version:
```
uname -v
```

---

# Set the hostname:
[Source](https://www.redhat.com/sysadmin/change-hostname-linux)
```
sudo hostnamectl set-hostname josh.test.com
```

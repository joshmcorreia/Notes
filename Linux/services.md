# Services:

### List all services:
[Source](https://www.tecmint.com/list-all-running-services-under-systemd-in-linux/)
```
systemctl
```

### List all running services:
[Source](https://www.tecmint.com/list-all-running-services-under-systemd-in-linux/)
```
systemctl list-units --type=service --state=running
```

### List the status of a particular service:
```
systemctl status polkit
```

### Enable a particular service:
```
sudo systemctl enable polkit
```

### Disable a particular service:
```
sudo systemctl disable polkit
```

### Start a particular service:
```
sudo systemctl start polkit
```

### Stop a particular service:
```
sudo systemctl stop polkit
```

### View the logs of a particular service:
```
journalctl -xeu polkit
```

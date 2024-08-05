# nmcli

---

# Enable the internet connection:
[Source](https://askubuntu.com/questions/434660/how-can-i-disable-my-internet-connection-from-terminal)
```
nmcli networking on
```

---

# Disable the internet connection:
[Source](https://askubuntu.com/questions/434660/how-can-i-disable-my-internet-connection-from-terminal)
```
nmcli networking off
```

---

# List all devices:
```
nmcli
```
Example:
```
# nmcli device
DEVICE  TYPE      STATE      CONNECTION
ens18   ethernet  connected  ens18
lo      loopback  unmanaged  --
```

---

# Activate a specific connection:
```
nmcli con up ens18
```
Example:
```
# nmcli con up ens18
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/2)
```

---

# Set an interface to autoconnect:
```
nmcli connection modify {DEVICE} connection.autoconnect yes
```
Example:
```
# nmcli connection modify ens18 connection.autoconnect yes
```

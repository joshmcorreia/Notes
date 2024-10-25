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
# nmcli device
DEVICE      TYPE        STATE         CONNECTION
eno1        ethernet    connected     eno1
idrac       ethernet    connected     Wired connection 1
enp130s0f0  ethernet    disconnected  --
enp130s0f1  ethernet    disconnected  --
ib0         infiniband  disconnected  --
eno2        ethernet    unavailable   --
eno3        ethernet    unavailable   --
eno4        ethernet    unavailable   --
ib1         infiniband  unavailable   --
lo          loopback    unmanaged     --
```

---

# List all connections:
```
# nmcli connection show
NAME                UUID                                  TYPE        DEVICE
eno1                8cc0782f-fe86-413a-82f2-d9cbc01fdf05  ethernet    eno1
Wired connection 1  55a5e361-2cff-33c8-bfe3-e3bd31b5867d  ethernet    idrac
eno2                573143ba-3072-4e68-8518-e736654c91e2  ethernet    --
eno3                54d76c91-f973-4633-9677-3e12ed3baaef  ethernet    --
eno4                c52facac-c345-48fd-9811-33a4dbe6a43d  ethernet    --
enp0s26u1u6u3       29f45dce-b652-4e4b-ae59-93effe6bf8e8  ethernet    --
enp130s0f0          e8d946ab-3889-413b-9a29-bb270a656fba  ethernet    --
enp130s0f1          290c61ce-fbce-4b49-9d4d-10391e4a7f34  ethernet    --
ib0                 e421917e-ed2d-4bb4-950a-aca9dabc20ef  infiniband  --
ib1                 412a097a-ee42-4bac-a166-15a00ffecb6f  infiniband  --
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

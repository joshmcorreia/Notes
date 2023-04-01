# Networking:

### Enable your internet connection:
[Source](https://askubuntu.com/questions/434660/how-can-i-disable-my-internet-connection-from-terminal)
```
nmcli networking on
```

### Disable your internet connection:
[Source](https://askubuntu.com/questions/434660/how-can-i-disable-my-internet-connection-from-terminal)
```
nmcli networking off
```

### Get your IP address:
```
ip a
```
OR
```
ifconfig
```

### Get a new IP address (DHCP):
[Source](https://serverfault.com/a/42804)
```
sudo dhclient -r # release the lease on the IP address
sudo dhclient # lease a new IP address
```

### Manually set your IP address:
[Source](https://danielmiessler.com/study/manually-set-ip-linux/)
```
sudo ifconfig eth0 {desired_ip_address} netmask 255.255.255.0 up

Example:
sudo ifconfig eth0 192.168.1.5 netmask 255.255.255.0 up
```

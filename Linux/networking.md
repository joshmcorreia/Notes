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

**Note:** Be careful when doing this over SSH. If you don't combine these statements you can end up killing the network on the device and it won't lease a new IP address.
```
# release the current lease on the IP address and then lease a new one
sudo dhclient -r && sudo dhclient
```

### Manually set your IP address:
[Source](https://danielmiessler.com/study/manually-set-ip-linux/)
```
sudo ifconfig eth0 {desired_ip_address} netmask 255.255.255.0 up

Example:
sudo ifconfig eth0 192.168.1.5 netmask 255.255.255.0 up
```

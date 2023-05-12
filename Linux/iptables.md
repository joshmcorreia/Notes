# iptables

## Installing iptables
```
sudo apt-get install iptables
```

## Check current rules
```
sudo iptables -L -v
```

## Disable responses to ICMP/ping
**Note:** It is a bad idea to disable ICMP, it has many uses and disabling it will probably have unintended consequences.
```
sudo iptables -I INPUT -p icmp --icmp-type 8 -j DROP
```

## Create a chain
```
sudo iptables -N ALLOW_SSH_ACCESS
```

## Delete a chain
```
sudo iptables -X ALLOW_SSH_ACCESS
```

## Only allow certain IPs to access a specific port
[Source](https://serverfault.com/a/146576)
```
sudo iptables -N ALLOW_SSH_ACCESS
sudo iptables -A ALLOW_SSH_ACCESS --src 192.168.232.130 -j ACCEPT  # allow 192.168.232.130
sudo iptables -A ALLOW_SSH_ACCESS --src 192.168.232.131 -j ACCEPT  # allow 192.168.232.131
sudo iptables -A ALLOW_SSH_ACCESS -j DROP # drop everyone else
sudo iptables -I INPUT -m tcp -p tcp --dport 22 -j ALLOW_SSH_ACCESS  # use chain ALLOW_SSH_ACCESS for packets coming to TCP port 22
```

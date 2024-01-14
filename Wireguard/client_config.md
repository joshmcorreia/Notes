# Wireguard Client Config

## AllowedIPs
In the client's config file you'll see something similar to
```
[Peer]
...
AllowedIPs = 192.168.1.0/24
```
This `AllowedIPs` line tells the Wireguard client to forward traffic that falls within the `AllowedIPs` range. For example, the config above would allow the client to hit any IP from 192.168.1.1 to 192.168.1.255 over the VPN.

Even though the config file is generated on the server side, you cannot rely on this as a way to prevent the user from accessing other IPs on your network. Since this config file resides on the client, the client is able to change it at will, which means they could change it to access ANY machine on your network.

To prevent the client from accessing other IPs on your network or to prevent them from sending all traffic through your VPN you need to block these requests through a firewall such as `iptables`.

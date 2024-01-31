# Wireguard Server (Docker)
For documentation, see [docker-wireguard](https://github.com/linuxserver/docker-wireguard)

## Connect to the docker container
```
$ docker exec -it wireguard /bin/bash
```

## Monitor the logs
```
docker logs -f wireguard
```

## Get the QR code of a specific peer
```
$ docker exec -it wireguard /app/show-peer 1
```

## View which peers are connected
```
$ docker exec -it wireguard wg show
```

## Turn on the interface
```
$ wg-quick up wg0
```

## Shut down the interface
```
$ wg-quick down wg0
```

---

# Wireguard Config Settings

## PreUp
These settings are applied on the server before the client connects.

## PostUp
These settings are applied on the server when the client connects.

## PostDown
These settings are applied on the server when the client disconnects.

## PostUp Defaults Explained
```
# accept all incoming forwarded traffic
iptables -A FORWARD -i %i -j ACCEPT;
# accept all outgoing forwarded traffic
iptables -A FORWARD -o %i -j ACCEPT;
# 
iptables -t nat -A POSTROUTING -o eth+ -j MASQUERADE
```

## PostDown Defaults Explained
```
# no longer accept all incoming forwarded traffic
iptables -D FORWARD -i %i -j ACCEPT;
# no longer accept all outgoing forwarded traffic
iptables -D FORWARD -o %i -j ACCEPT;
# 
iptables -t nat -D POSTROUTING -o eth+ -j MASQUERADE
```

## Wireguard config file location
```
/config
/etc/wireguard/wg0.conf
```

## Wireguard config file - %i
[Why does `%i` mean the Wireguard interface?](https://forum.openwrt.org/t/why-does-i-mean-the-wireguard-interface/110683)

You may have noticed `%i` in the `wg0.conf` file. This is a templating replacement handled by `wg-quick` which will replace `%i` with the current Wireguard interface.

Example:
```
PostUp = iptables -A FORWARD -i %i -j ACCEPT
```
becomes
```
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT
```

## Route all traffic through your home network
```
```

## Give users full access to your LAN
These are the default options set for Wireguard:
```
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth+ -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth+ -j MASQUERADE
```

## Only allow users to access one IP address
[Limit Wireguard client access to only a few servers](https://superuser.com/questions/1740482/limit-wireguard-client-access-to-only-a-few-servers)
```
PostUp = iptables -t nat -I POSTROUTING -o eth+ -j MASQUERADE

# Add a WIREGUARD_wg0 chain
PostUp = iptables -N WIREGUARD_wg0
PostUp = iptables -A FORWARD -j WIREGUARD_wg0

# This client can only access these servers.
PostUp = iptables -A WIREGUARD_wg0 -s 192.168.2.2 -i %i -d 192.168.1.2 -j ACCEPT
PostUp = iptables -A WIREGUARD_wg0 -s 192.168.2.2 -i %i -j DROP

# Drop everything else coming through the Wireguard interface
PostUp = iptables -A WIREGUARD_wg0 -i %i -j DROP

# Return to FORWARD chain
PostUp = iptables -A WIREGUARD_wg0 -j RETURN

PostDown = iptables -t nat -D POSTROUTING -o eth+ -j MASQUERADE

# Flush and delete the WIREGUARD_wg0 chain
PostDown = iptables -D FORWARD -j WIREGUARD_wg0
PostDown = iptables -F WIREGUARD_wg0
PostDown = iptables -X WIREGUARD_wg0
```

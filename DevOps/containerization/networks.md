# Docker Networks

## Sources
- [Docker Networking Tutorial // ALL Network Types explained!](https://www.youtube.com/watch?v=5grbXvV_DSk)

## Network types
- bridge
- host
- macvlan
- ipvlan

## Create a network
```
$ sudo docker network create mybridge
bda1a1795868810ac055968586e26f18963ef08a1c4b2a69c3b3c2df8bcfacd4
```

## List all networks
```
$ sudo docker network ls
NETWORK ID     NAME                    DRIVER    SCOPE
90845c52a050   bridge                  bridge    local
c371fd32382d   gitlab-server_default   bridge    local
a07194c37109   gitlab_default          bridge    local
6c0d615c0e45   gitlab_stuff_default    bridge    local
a6b2e2640cf2   host                    host      local
6a97b251ec1a   none                    null      local
efdfc5fed4f3   pihole_hfnet            bridge    local
```

## Remove a network
```
$ sudo docker network rm pihole_default
pihole_default
```

## Inspect the network settings of a container
```
$ sudo docker inspect pihole
...
"NetworkSettings": {
    "Bridge": "",
    "SandboxID": "315dd0732138c54c402e4761f311973917111f4244c21c202e20348942e6b9e4",
    "HairpinMode": false,
    "LinkLocalIPv6Address": "",
    "LinkLocalIPv6PrefixLen": 0,
    "Ports": {
        "53/tcp": [
            {
                "HostIp": "0.0.0.0",
                "HostPort": "53"
            },
            {
                "HostIp": "::",
                "HostPort": "53"
            }
        ],
        "53/udp": [
            {
                "HostIp": "0.0.0.0",
                "HostPort": "53"
            },
            {
                "HostIp": "::",
                "HostPort": "53"
            }
        ],
        "67/udp": null,
        "80/tcp": [
            {
                "HostIp": "0.0.0.0",
                "HostPort": "8081"
            },
            {
                "HostIp": "::",
                "HostPort": "8081"
            }
        ]
    },
    "SandboxKey": "/var/run/docker/netns/315dd0732138",
    "SecondaryIPAddresses": null,
    "SecondaryIPv6Addresses": null,
    "EndpointID": "",
    "Gateway": "",
    "GlobalIPv6Address": "",
    "GlobalIPv6PrefixLen": 0,
    "IPAddress": "",
    "IPPrefixLen": 0,
    "IPv6Gateway": "",
    "MacAddress": "",
    "Networks": {
        "pihole_default": {
            "IPAMConfig": null,
            "Links": null,
            "Aliases": [
                "pihole",
                "pihole",
                "28195ea83579"
            ],
            "NetworkID": "f7b59a08c3ed02dbfcd8d6c9cab01473be632cdde9096b036ecb3a8b1e8c9b20",
            "EndpointID": "327f81a2c31986aaf58ebf6f717491e4403f3dae4b31c619efaa364852ad398f",
            "Gateway": "172.19.0.1",
            "IPAddress": "172.19.0.2",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "MacAddress": "02:42:ac:13:00:02",
            "DriverOpts": null
        }
    }
}
```

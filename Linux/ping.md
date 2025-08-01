# ping

---

## Ping an IP address
```
$ ping 127.0.0.1
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.023 ms
64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.048 ms
^C
--- 127.0.0.1 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1019ms
rtt min/avg/max/mdev = 0.023/0.035/0.048/0.013 ms
```

---

## Ping an IP address from a specific interface
```
$ ping -I eth1 127.0.0.1
```
On IPv6 you can also use the following syntax:
```
$ ping 2001:db8:3333:4444:5555:6666:7777:8888%eth1
```

---

## Ping a specific amount of times
```
$ ping 127.0.0.1 -c 2
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.020 ms
64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.014 ms

--- 127.0.0.1 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1009ms
rtt min/avg/max/mdev = 0.014/0.017/0.020/0.003 ms
```

---

## Ping at a specific interval
```
# pings every 0.2s
$ ping 127.0.0.1 -i 0.2
```

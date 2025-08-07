# tcpdump

---

## Capture network traffic
```
$ sudo tcpdump
```

---

## Exclude a specific port
The following example excludes SSH traffic
```
$ sudo tcpdump not port 22
```

---

## Monitor a specific interface
```
$ sudo tcpdump -i eth2
```

---

## Don't convert addresses to names
```
$ sudo tcpdump -n
```

---

## Only include traffic from a specific host
```
$ sudo tcpdump host $HOSTNAME
```

---

## Monitor ICMP traffic
```
$ sudo tcpdump icmp
```

---

## See localhost traffic
Note: It seems that localhost traffic is excluded by default
```
$ sudo tcpdump -i lo
```
Or to see all traffic
```
$ sudo tcpdump -i any
```

---

## Capture only IPv6
```
$ sudo tcpdump ip6
```

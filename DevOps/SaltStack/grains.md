# SaltStack Grains
- [User Guide Documentation](https://docs.saltproject.io/salt/user-guide/en/latest/)

## What are grains?
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/grains.html)
> This is called the grains interface, because it presents Salt with grains of information. Grains are collected for the operating system, domain name, IP address, kernel, OS type, memory, and many other system properties.

> Grain data is relatively static. However, if system information changes (such as network settings), or if a new value is assigned to a custom grain, grain data is refreshed.

## List all grains
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/grains.html#listing-grains)
```
sudo salt '*' grains.ls
```

## List all grains and their data (values)
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/grains.html#listing-grains)
```
sudo salt '*' grains.items
```

## List specific grain data
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/grains.html#targeting-with-grains)
```
sudo salt '*' grains.item cpuarch
```
You can also list the specific grain data of multiple grains at once
```
sudo salt '*' grains.item cpuarch region
```

## Targeting with grains
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/grains.html#targeting-with-grains)
```
# target all 64 bit CPUs and print out the number of CPUs on each
sudo salt -G 'cpuarch:x86_64' grains.item num_cpus
```

## Apply a Salt State to specific grains
[Source](https://docs.saltproject.io/en/latest/topics/targeting/index.html#targeting-with-grains)
```
sudo salt -G 'cpuarch:x86_64' state.apply stop_nginx
```

## Defining custom grains from the Salt Master
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/grains.html#defining-custom-grains)
```
sudo salt minion01 grains.setval deployment datacenter4
```

## Get the IP of every minion
```
$ sudo salt '*' network.interface_ip eth0
ip-10-0-0-52:
    10.0.0.52
```

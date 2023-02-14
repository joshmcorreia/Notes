# SaltStack Grains
- [User Guide Documentation](https://docs.saltproject.io/salt/user-guide/en/latest/)

## What are grains?
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/grains.html)
> This is called the grains interface, because it presents Salt with grains of information. Grains are collected for the operating system, domain name, IP address, kernel, OS type, memory, and many other system properties.

> Grain data is relatively static. However, if system information changes (such as network settings), or if a new value is assigned to a custom grain, grain data is refreshed.

## List available grains
```
sudo salt '*' grains.ls
```

## List grains data
```
sudo salt '*' grains.items
```

## List specific grain data
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/grains.html)
```
sudo salt '*' grains.item cpuarch
```

## Targetting with grains
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/grains.html)
```
# target all 64 bit CPUs and print out the number of CPUs on each
sudo salt -G 'cpuarch:x86_64' grains.item num_cpus
```

## Defining custom grains from the Salt Master
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/grains.html)
```
sudo salt minion01 grains.setval deployment datacenter4
```

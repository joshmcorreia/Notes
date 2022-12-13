# SaltStack Grains

[Documentation](https://docs.saltproject.io/en/latest/topics/grains/index.html)

## What are grains?
Grains contain relatively static information about each minion, such as the CPU architecture, kernel, IP address, etc.

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

# Calling Salt from Python

## Installing the packages
```
sudo pip3 install salt
```

## Running a command on all minions
[Source](https://docs.saltproject.io/en/latest/ref/clients/index.html)

Note: Since the salt master runs as root you need to make sure to run Python3 as root, `sudo python3`
```
>>> import salt.client
>>> local_client = salt.client.LocalClient()
>>> command = "whoami"
>>> local_client.cmd('*', 'cmd.run', [command])
{'ip-10-0-1-187': 'root', 'ip-10-0-1-24': 'root'}
```

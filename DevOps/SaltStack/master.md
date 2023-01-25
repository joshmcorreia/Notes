# Salt Master

## Security
According to the SaltStack website, "a master that is open to the internet is considered a security vulnerability."

Make sure that the Salt Master accepts incoming connections on ports 4505 and 4506, but only from known IPs or IP ranges. Use proper access control lists to prevent random users on the internet from sending their minion keys to the Salt Master in an attempt to gain access to your network. This is especially crucial on systems where the Salt Master automatically accepts minion keys.

## List minion keys
```
$ sudo salt-key -L
Accepted Keys:
Denied Keys:
Unaccepted Keys:
Rejected Keys:
```

## Accept all minion keys
[Source](https://docs.saltproject.io/en/latest/ref/cli/salt-key.html)
```
sudo salt-key -A
```

## Delete all minion keys
[Source](https://docs.saltproject.io/en/latest/ref/cli/salt-key.html)
```
sudo salt-key -D
```

## Delete a denied key
Denied keys are stored in `/etc/salt/pki/master/minions_denied/` as files and can be deleted like any other file.

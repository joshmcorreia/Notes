# Salt Master

## List minion keys
```
$ sudo salt-key -L
Accepted Keys:
Denied Keys:
Unaccepted Keys:
Rejected Keys:
```

## Accept all minion keys
```
sudo salt-key -A
```

## Delete a denied key
Denied keys are stored in `/etc/salt/pki/master/minions_denied/` as files and can be deleted like any other file.


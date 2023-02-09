# Beacons
[Beacons - Salt User Guide](https://docs.saltproject.io/salt/user-guide/en/latest/topics/beacons.html)

---

## Monitor when changes are made to a file on a minion
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/beacons.html#minion-configuration)

In the following example, we will be able to monitor when changes are made to a file on the minion. When changes are made to the file, an event will be sent to the Salt Master.

First you need to install the `pyinotify` pip package on each minion
```
sudo salt-pip install pyinotify
```

Then you need to edit `/etc/salt/minion.d/beacons.conf` on the minion
```
beacons:
  inotify:
    - files:
       /home/ubuntu/test.txt:
         mask:
           - create
           - delete
           - modify
```

After changes are made to the beacon file you will need to restart the minion
```
sudo systemctl restart salt-minion
```

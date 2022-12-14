# Salt SSH
[Documentation](https://docs.saltproject.io/salt/user-guide/en/latest/topics/salt-ssh.html)

>The Salt SSH system does not supersede the standard Salt communication systems. It simply offers an SSH-based alternative that does not require a remote agent.

**Important: "Be aware that since all communication with Salt SSH is executed via the SSH protocol, it is substantially slower than the standard Salt master-minion model."**

## Minion Requirements
- Python (unless running raw SSH commands)
- SSH service running (and have the SSH port open)

## Install Salt SSH on the Salt Master
```

```

## Roster File
The roster file contains information on how to log into each machine

The default location for the roster file is `/etc/salt/roster`

Example roster file:
```
web1:
  user: josh
  sudo: True
  host: 192.0.2.1
  priv: /home/josh/admin.pem

web2:
  user: dave
  passwd: Salt4Me!
  host: 192.0.2.2
  port: 2222
  sudo: True
```

## Ping all machines
```
sudo salt-ssh -i '*' test.ping
```

## Run commands on all machines
```
sudo salt-ssh '*' cmd.run "whoami"
```

## Run raw commands on all machines
```
sudo salt-ssh '*' -r "whoami"
```

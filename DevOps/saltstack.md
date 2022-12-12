# SaltStack

## Basic Tutorial
https://docs.saltproject.io/en/latest/topics/tutorials/walkthrough.html

## Bootstrap Installation
[Source](https://docs.saltproject.io/salt/install-guide/en/latest/topics/bootstrap.html#install-bootstrap)

### Master Install
```
curl -o bootstrap-salt.sh -L https://bootstrap.saltproject.io
chmod +x bootstrap-salt.sh
sudo ./bootstrap-salt.sh -MN
```

### Minion Install
```
curl -o bootstrap-salt.sh -L https://bootstrap.saltproject.io
chmod +x bootstrap-salt.sh
sudo ./bootstrap-salt.sh

# You can also optionally specify the master IP address
sudo ./bootstrap-salt.sh -A 192.0.2.1
```

---

### Start the salt master
```
sudo systemctl start salt-master
```

### Start the salt minion
```
sudo systemctl start salt-minion
```

### Debug the salt minion in the foreground
```
sudo systemctl stop salt-minion
sudo salt-minion -l debug
```

### List minion keys on the master
```
sudo salt-key -L
```

### Accept all minion keys on the master
```
sudo salt-key -A
```

### Check the version of salt on all minions
```
sudo salt '*' test.version
```

### Run a command on all minions
```
sudo salt '*' cmd.run 'ls -l /etc'
```

### Install a package on all minions
```
sudo salt '*' pkg.install vim
```

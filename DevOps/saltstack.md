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

### Installing saltstack on multiple IPs at once (requires internet)

First create a file containing all of the IPs
```
touch ips.txt

192.168.0.1
192.168.0.2
192.168.0.3
```
Then create the script that will connect to all ips
```
vim install_salt_over_ssh.sh
chmod +x install_salt_over_ssh.sh
```
and copy the following into the file (edited script from [here](https://unix.stackexchange.com/a/78594)):
```
#!/bin/bash
IP_FILE="ips.txt"
if [[ ! -f ${IP_FILE} ]]; then
   echo "No File!"
   exit 1
fi
for IP_ADDRESS in $(cat $IP_FILE); do
    echo "Installing salt on ${IP_ADDRESS}"
    ssh -i demo.pem -o StrictHostKeyChecking=no ${IP_ADDRESS} "curl -o bootstrap-salt.sh -L https://bootstrap.saltproject.io; chmod +x bootstrap-salt.sh; sudo ./bootstrap-salt.sh -A 10.0.0.80; sudo systemctl start salt-minion" &
done
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

---

# Salt Cloud/Saltify
[Documentation](https://docs.saltproject.io/en/latest/topics/cloud/saltify.html)

### Master Install
```
curl -o bootstrap-salt.sh -L https://bootstrap.saltproject.io
chmod +x bootstrap-salt.sh
sudo ./bootstrap-salt.sh -MNL
```

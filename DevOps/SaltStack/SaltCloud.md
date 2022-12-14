# SaltStack - Salt Cloud

---

## Documentation
- [Install Salt Cloud](https://docs.saltproject.io/en/latest/topics/cloud/install/index.html)
- [Getting Started with Saltify](https://docs.saltproject.io/en/latest/topics/cloud/saltify.html)

---

## Master Install
```
curl -o bootstrap-salt.sh -L https://bootstrap.saltproject.io
chmod +x bootstrap-salt.sh
sudo ./bootstrap-salt.sh -MNL
```

## Minion Install
Unlike other installation methods, Salt Cloud automates the installation process so you don't have to manually install the salt-minion on every node

---

# Master Setup

### Generate a key file
```
ssh-keygen -b 4096
```

### Set up SSH keys on the minion node
```
ssh-copy-id 192.168.0.2
```
OR
```
ssh-copy-id josh@192.168.0.2
```

### Configuration
```
sudo vim /etc/salt/cloud.providers
```
Paste the following into the file
```
my-saltify-config:
  minion:
    master: 111.222.333.444
  driver: saltify
```
and update the IP address to be the IP address of your master node

### Profiles

Edit the cloud profile
```
sudo vim /etc/salt/cloud.profiles
```
and paste the following into the file
```
salt-this-machine:
  ssh_host: 12.34.56.78
  ssh_username: root
  key_filename: '/etc/salt/mysshkey.pem'
  provider: my-saltify-config
```

---

# Controlling the nodes

### Install salt on all minions
```
salt-cloud -p salt-this-machine my-machine
```

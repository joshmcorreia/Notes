# SSH:

### Generate SSH keys:
[How to setup SSH keys with Bitbucket](https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/)
```
ssh-keygen # uses the default key size, currently 3072 bits

ssh-keygen -t ed25519 # use ed25519 instead of RSA

ssh-keygen -b 4096 # specifies the key size to be 4096 bits
```

### Copy SSH keys from one Linux box to another Linux box:
[Source](https://askubuntu.com/a/4833)
```
ssh-copy-id user@hostname.example.com
```

### Copy SSH keys from a Windows box to a Linux box:
[Source](https://www.chrisjhart.com/Windows-10-ssh-copy-id/)
```
type $env:USERPROFILE\.ssh\id_rsa.pub | ssh hostname.example.com "cat >> .ssh/authorized_keys"
```

### Connecting to another system:
```
ssh josh@josh.test.com
```

### Running a command on another system:
```
ssh josh@josh.test.com ls
```

---

# SSH Config

### Creating the SSH config
```
touch ~/.ssh/config
chmod 600 ~/.ssh/config
```

### Sample SSH config
```
Host obsidian
    HostName obsidian.example.com
    User josh
    Port 2222
```

### SSH config with specific key file
```
Host obsidian
    HostName obsidian.example.com
    User josh
    Port 2222
    IdentityFile ~/.ssh/josh.key
```

### Using ProxyJump to SSH through a proxy
```
Host jumpserver
    HostName jumpserver.example.com
    User josh
    Port 1111

Host obsidian
    HostName obsidian.example.com
    User josh
    Port 2222
    ProxyJump jumpserver
```

### Using SSH Configs
Once a host is defined in your SSH config, all you need to do to use it is connect to it by the "Host" field
```
ssh obsidian
```

---

# Securing an SSH Server:

### Disable root login:
Edit `/etc/ssh/sshd_config` and add the following line:
```
PermitRootLogin no
```
Then restart the sshd service:
```
sudo systemctl restart ssh.service
```

### Disable password authentication:
**Note:** Make sure to set up SSH keys before doing this

Edit `/etc/ssh/sshd_config` and add the following line:
```
PasswordAuthentication no
```
Then restart the sshd service:
```
sudo systemctl restart ssh.service
```

### Change the default port:
By default, SSH servers run on port 22. By changing the port to something else, port-scanners are a lot less likely to find your server. Make sure to use a port that isn't currently in use or reserved (should be able to use ports 1024-65535).

### Only allow specific users to log in:
Edit `/etc/ssh/sshd_config` and add the following line:
```
AllowUsers josh bob
```
Then restart the sshd service:
```
sudo systemctl restart ssh.service
```

# SSH:

### Generate SSH keys:
[How to setup SSH keys with Bitbucket](https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/)
```
ssh-keygen # uses the default key size, currently 3072 bits

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

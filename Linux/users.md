# User management:

### Create a user:
```
sudo useradd josh
```

### Create a user with a home directory:
```
sudo useradd -m josh
```

### Create a user with a specific home directory:
```
sudo useradd -m josh -d /home/josh2
```

### Create a user with a specific login shell:
```
sudo useradd -s /usr/bin/zsh josh
```

### Delete a user:
```
userdel josh
```

### Set a user's password:
```
sudo passwd josh
```

---

# List Users:

### List all non-system users:
[Source](https://stackoverflow.com/a/33150591/7487335)
```
awk -F: '($3>=1000)&&($1!="nobody"){print $1}' /etc/passwd
```

### List all system users:
[Source](https://stackoverflow.com/a/33150591/7487335)
```
awk -F: '($3<1000){print $1}' /etc/passwd
```

### List all users:
[Source](https://stackoverflow.com/a/33150591/7487335)
```
awk -F: '($3){print $1}' /etc/passwd
```

### List all users with their UIDs:
[Source](https://askubuntu.com/a/645246/930990)
```
cut -d: -f1,3 /etc/passwd
```

### List all users with login shells:
[Source](https://askubuntu.com/a/1183913/930990)
```
sudo cat /etc/passwd | grep -v /bin/false | grep -v /usr/sbin/nologin
```

### List all users with valid passwords:
[Source](https://askubuntu.com/a/1183913/930990)
```
sudo cat /etc/shadow | grep '^[^:]*:[^\*!]'
```

### List who is currently logged into the machine:
[Source](https://www.cyberciti.biz/faq/how-to-show-current-logged-in-users-in-linux/)
```
w
```
OR
```
who
```
OR
```
who -a
```

---

# Login shells:

### Change your login shell:
Note: Requires you to log out and back in
```
chsh -s /bin/zsh
```

### Change the login shell of another user:
Note: Requires that user to log out and back in
```
chsh -s /bin/zsh josh
```

### Print the login shell of another user:
```
getent passwd username | cut -d: -f7
```

### Disable the login shell of another user:
```
usermod -s /usr/sbin/nologin username
```

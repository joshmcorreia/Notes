# System information:

### Print out system information:
```
uname -a
```
OR
```
cat /etc/os-release
```
OR
```
lsb_release -a
```
OR
```
hostnamectl
```

### Print the kernel release:
```
uname -r
```

### Print the kernel version:
```
uname -v
```

---

# Directory traversal:

### Change directories to a specific directory:
```
cd /usr/sbin/
```

### Change directories to the home directory:
```
cd ~
```
OR
```
cd
```

### Change directories to the parent directory:
```
cd ..
```

### Change directories to the previous directory:
```
cd -
```

---

# Set the hostname:
[Source](https://www.redhat.com/sysadmin/change-hostname-linux)
```
sudo hostnamectl set-hostname josh.test.com
```

---

# Terminal shortcuts:

### Quit a process:
NOTE: This sends a `SIGINT` signal<br>
<kbd>CTRL</kbd> + <kbd>C</kbd>

### Suspend a process:
NOTE: This sends a `SIGTSTP` signal<br>
<kbd>CTRL</kbd> + <kbd>Z</kbd>

### Restore a suspended process: ([Source](https://unix.stackexchange.com/a/45029/340031))<br>
```
jobs

fg %1 (replace this number with the process that returns from the `jobs` command)
```

---

# Services:

### List all services:
[Source](https://www.tecmint.com/list-all-running-services-under-systemd-in-linux/)
```
systemctl
```

### List all running services:
[Source](https://www.tecmint.com/list-all-running-services-under-systemd-in-linux/)
```
systemctl list-units --type=service --state=running
```

---

# Ports:

### List what ports are open:
[Source](https://www.tecmint.com/list-all-running-services-under-systemd-in-linux/)
```
netstat -ltup
```
Note: `netstat` has been deprecated on some machines, and has been replaced by the following:
```
ss -ltup
```

---

# Networking:

### Get your IP address:
```
ip a
```
OR
```
ifconfig
```

### Get a new IP address (DHCP):
[Source](https://serverfault.com/a/42804)
```
sudo dhclient -r # release the lease on the IP address
sudo dhclient # lease a new IP address
```

### Manually set your IP address:
[Source](https://danielmiessler.com/study/manually-set-ip-linux/)
```
sudo ifconfig eth0 {desired_ip_address} netmask 255.255.255.0 up

Example:
sudo ifconfig eth0 192.168.1.5 netmask 255.255.255.0 up
```

---

# Display file information:

### Get the architecture of an executable:
```
file output.txt
```

### Get the Access/Modify/Change/Birth times of a file:
```
stat output.txt
```

---

# Display file sizes:

### Single file:
[Source](https://stackoverflow.com/a/11720900/7487335)
```
ls -sh file.txt
```

### Each file in a directory:
[Source](https://stackoverflow.com/a/35439802/7487335)
```
ls -lh /var/log/josh
```

---

# Find files:

### Find a specific file given the filename:
```
find / -name "josh.txt" 2>/dev/null
```

### Find all files with a specific extension:
```
find / -name *.txt 2>/dev/null

NOTE: in zsh you need to put quotes around the wildcard to prevent glob expansion
find / -name '*.txt' 2>/dev/null
```

### Find all files containing a certain string in the filename:
```
sudo find / -name "*josh*" 2>/dev/null
```

---

# View files:

### Print out the contents of a file:
```
cat file.txt
```

### View the hexdump of a file as characters:
```
hexdump -c file.txt
```

### View the hexdump of a file as hex:
```
hexdump -C file.txt
```

### Output the end of a file:
```
tail file.txt
```

### Output the last X lines of a file:
```
tail -200 file.txt
```

### Output data that's appended to a file:
```
tail -f file.txt
```

### Output data that's appended to a file and exclude lines that contain a specific word:
```
tail -f file.txt | grep -v "DEBUG"
```

---

# Edit files:

### Empty the contents of a file:
[Source](https://unix.stackexchange.com/a/88810/340031)
```
truncate -s 0 file.txt
```

### Overwrite a file with text:
[Source](https://unix.stackexchange.com/a/88810/340031)
```
echo "text" > file.txt
```

### Append to the end of a file:
[Source](https://unix.stackexchange.com/a/88810/340031)
```
echo "text" >> file.txt
```

---

# Groups:

### Print out full group information:
```
cat /etc/group
```

### Print out all group names:
```
getent group | cut -d: -f1
```

### List what users belong to a group:
Note: this command does not include users who have this group as their primary group ([Source](https://unix.stackexchange.com/a/241239/340031))
```
getent group wheel

# user names only
getent group wheel | awk -F: '{print $4}'
```
OR
```
grep -w wheel /etc/group

# user names only
grep -w wheel /etc/group | awk -F: '{print $4}'
```
OR
```
sudo groupmems -g wheel -l
```

### List what groups a user belongs to:
```
groups josh

# group names only
groups josh | awk -F: '{print $2}'
```
OR
```
id josh

# exclude uid/gid
id josh | cut -d ' ' -f 3
```

### Add a user to a group:
[Source](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)
Note: this user must log out of all instances for group changes to take effect
```
sudo usermod -a -G name_of_group username
```

### Add a user to multiple groups:
[Source](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)
Note: this user must log out of all instances for group changes to take effect
```
sudo usermod -a -G group1,group2 username
```

### Change a user's primary group:
[Source](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)
Note: this user must log out of all instances for group changes to take effect
```
sudo usermod -g name_of_group username
```

### Remove a user from a group:
[Source](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)
Note: this user must log out of all instances for group changes to take effect
```
sudo gpasswd -d username name_of_group
```

### Delete a group:
[Source](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)
```
sudo groupdel name_of_group
```

---

# File ownership/permissions:

### Set file permissions:
```
chmod 750 file.txt
```

### Recursively set file permissions:
```
sudo chmod -R 750 /var/log/josh
```

### Change the owner of a file:
```
chown josh file.txt
```

### Recursively change the owner of a file:
```
chown -R josh /var/log/josh
```

### Print out the user who owns a file:
```
stat -c "%U" file.txt
```

### Print out the group that owns a file:
```
stat -c "%G" file.txt
```

### Find all directories with the sticky bit set:
```
find / -perm -1000 2>/dev/null
```

### Find all directories with the setgid bit set:
```
find / -perm -2000 2>/dev/null
```

### Find all directories with the setuid bit set:
```
find / -perm -4000 2>/dev/null
```

---

# File redirection:

### Redirect errors to devnull:
```
2>/dev/null
```

---

# Aliases/Commands:

### List your aliases:
[Source](https://www.tecmint.com/create-alias-in-linux/)
```
alias
```

### Create an alias:
Note: If you want this to be permanent, add it to your shell config such as `~/.bashrc`<br>
[Source](https://www.tecmint.com/create-alias-in-linux/)
```
alias explode="ls -la"
```

### Remove an alias:
[Source](https://www.tecmint.com/create-alias-in-linux/)
```
unalias explode
```

### List all the commands you can run (bash only):
[Source](https://stackoverflow.com/a/949006)
```
compgen -c
```

### List all the built-ins you can run (bash only):
[Source](https://stackoverflow.com/a/949006)
```
compgen -b
```

---

# Environment variables:

### Print all environment variables:
Note: this is shell specific and will have different output depending on the shell, works in `bash` and `zsh`
```
printenv
```
OR
```
env
```
OR
```
declare -xp
```

---

# SSH:

### Generate SSH keys:
[How to setup SSH keys with Bitbucket](https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/)
```
ssh-keygen # uses the default key size, currently 3072 bits

ssh-keygen -b 4096 # specifies the key size to be 4096 bits
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

# Transfer files

### Copy from a local machine to a remote machine:
```
scp file.txt remote_username@10.10.0.2:/remote/directory
```

### Copy from a remote machine to your local machine:
```
scp remote_username@10.0.0.1:/home/josh/file.txt .
```

---

# User operations:

### Create a user:
```
sudo useradd josh
```

### Create a user with a home directory:
```
sudo useradd -m josh
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

---

# List Users

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

# `sudo` privileges

### How to make sudo remember your password for longer:
[Source](https://unix.stackexchange.com/questions/216891/how-do-i-make-sudo-remember-my-password-for-longer)
```
sudo visudo
OR
vim /etc/sudoers
# add the following line
Defaults timestamp_timeout=30 # sets the sudo timeout to be 30 minutes, default is 5
```

### How to show asterisks when typing in the sudo password:
[Source](https://www.tecmint.com/show-asterisks-sudo-password-in-linux/)
```
sudo visudo
OR
vim /etc/sudoers
# Replace the line 'Defaults env_reset' with the following:
Defaults env_reset,pwfeedback
```

---

# Shell Depth:

### Figure out how many shells deep you are:
[Source](https://unix.stackexchange.com/a/373713)<br>
Note: Returns 1 in the base shell, and increments by one for each additional shell that you get into. `ssh` will not increment this number and the new session has its own values.
```
echo $SHLVL
```

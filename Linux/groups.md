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
[How to Add User to Group in Linux](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)

Note: this user must log out of all instances for group changes to take effect
```
sudo usermod -a -G name_of_group username
```

### Add a user to multiple groups:
[How to Add User to Group in Linux](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)

Note: this user must log out of all instances for group changes to take effect
```
sudo usermod -a -G group1,group2 username
```

### Change a user's primary group:
[How to Add User to Group in Linux](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)

Note: this user must log out of all instances for group changes to take effect
```
sudo usermod -g name_of_group username
```

### Remove a user from a group:
[How to Add User to Group in Linux](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)

Note: this user must log out of all instances for group changes to take effect
```
sudo gpasswd -d username name_of_group
```

### Delete a group:
[How to Add User to Group in Linux](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)
```
sudo groupdel name_of_group
```

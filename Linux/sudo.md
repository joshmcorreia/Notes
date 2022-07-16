
# `sudo` Configuration

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

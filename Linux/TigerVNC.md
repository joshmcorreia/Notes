# TigerVNC

## Set the VNC password:
**Note:** This will create a password file at `~/.vnc/passwd`
```
$ vncpasswd
Password:
Verify:
Would you like to enter a view-only password (y/n)? n
```
Alternatively you can create a password file at a specific location:
```
$ vncpasswd passwd2
Password:
Verify:
Would you like to enter a view-only password (y/n)? n
```

## Start a session:
```
vncserver -depth 24 -geometry 1280x800 -localhost :1
```

## List all sessions:
```
$ vncserver -list

TigerVNC server sessions:

X DISPLAY #	RFB PORT #	PROCESS ID
:2		5902		2952
```

## Kill an existing session:
```
$ vncserver -kill :2
Killing Xtigervnc process ID 2952... success!
```

## Kill all existing sessions:
```
$ vncserver -kill :*
```

## Use XFCE4 as the Desktop environment:
[Source](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-20-04)

Open the `xstartup` file
```
sudo vim ~/.vnc/xstartup
```
and add the following lines
```
#!/bin/sh
# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
/usr/bin/startxfce4
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
```

## Debug connections:
If you're having an issue connecting you can look at the log files inside of `~/.vnc` to try to figure out what's happening.

Example of trying to use the incorrect password:
```
$ tail -f ip-10-0-0-161.ec2.internal:1.log
 SConnection: AuthFailureException: Authentication failure
 VNCSConnST:  closing 50.39.229.234::55721: Authentication failure:
              Authentication failure
```

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

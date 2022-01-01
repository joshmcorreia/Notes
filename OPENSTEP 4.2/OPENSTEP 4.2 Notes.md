# OPENSTEP-4.2-OS-Notes

### Terminal location:
NextApps -> Terminal.app

### Default shell:
/bin/csh

### Improved path:
```
set path="~/bin /usr/local/bin /usr/local/sbin /usr/gnu/bin /usr/samba/bin /usr/ucb /usr/bin /usr/etc /bin"
```

### Hotkeys:
<kbd>ALT</kbd>+<kbd>UP</kbd> - minimize the window

### Max RAM size:
512MB

### Max resolution:
1280 x 768

---

# Terminal stuff:

### Change to root user:
```
su
```

### Change your shell:
Note: results in 
```
su
ln -s /bin/passwd chsh
exit
chsh
```

### View host information:
```
/usr/bin/hostinfo
```

### Connect to box:
```
nc 192.168.199.131 21

telnet 192.168.199.131 13531

ftp 192.168.199.131
```

### Monitor active connections:
```
netstat
```

---

# Scanning results:
```
$ nmap -p- 192.168.199.132
Starting Nmap 7.80 ( https://nmap.org ) at 2021-12-20 22:09 PST
Nmap scan report for 192.168.199.132
Host is up (0.0041s latency).
Not shown: 65516 closed ports
PORT     STATE SERVICE
7/tcp    open  echo
9/tcp    open  discard
13/tcp   open  daytime
19/tcp   open  chargen
21/tcp   open  ftp
23/tcp   open  telnet
25/tcp   open  smtp
37/tcp   open  time
79/tcp   open  finger
111/tcp  open  rpcbind
178/tcp  open  nextstep
512/tcp  open  exec
513/tcp  open  login
514/tcp  open  shell
515/tcp  open  printer
854/tcp  open  dlep
856/tcp  open  unknown
857/tcp  open  unknown
2453/tcp open  madge-ltd
```
While scanning later I got these as well, while the ports 854/856/857 above were absent:
```
706/tcp  open  silc
708/tcp  open  unknown
709/tcp  open  entrustmanager
```

Full scan:
```
$ nmap -A 192.168.199.132
Starting Nmap 7.80 ( https://nmap.org ) at 2021-12-20 22:10 PST
Nmap scan report for 192.168.199.132
Host is up (0.21s latency).
Not shown: 986 closed ports
PORT    STATE SERVICE    VERSION
7/tcp   open  echo
9/tcp   open  discard?
13/tcp  open  daytime    Sun Solaris daytime
19/tcp  open  chargen
21/tcp  open  ftp
| fingerprint-strings: 
|   GenericLines: 
|     220 openstep42 FTP server (Version 5.1 (NeXT 1.0) Thu Mar 27, 1997) ready.
|     command not understood.
|     command not understood.
|   Help: 
|     220 openstep42 FTP server (Version 5.1 (NeXT 1.0) Thu Mar 27, 1997) ready.
|     214- The following commands are recognized (* =>'s unimplemented).
|     USER PORT STOR MSAM* RNTO NLST MKD CDUP 
|     PASS PASV APPE MRSQ* ABOR SITE XMKD XCUP 
|     ACCT* TYPE MLFL* MRCP* DELE SYST RMD STOU 
|     SMNT* STRU MAIL* ALLO CWD STAT XRMD SIZE 
|     REIN* MODE MSND* REST XCWD HELP PWD MDTM 
|     QUIT RETR MSOM* RNFR LIST NOOP XPWD 
|     Direct comments to ftp-bugs@openstep42.
|   NULL, SMBProgNeg: 
|     220 openstep42 FTP server (Version 5.1 (NeXT 1.0) Thu Mar 27, 1997) ready.
|   SSLSessionReq: 
|     220 openstep42 FTP server (Version 5.1 (NeXT 1.0) Thu Mar 27, 1997) ready.
|_    command not understood.
| ftp-syst: 
|   SYST: Version: BSD-43
|   STAT: 
|  openstep42 FTP server status:
|      Version 5.1 (NeXT 1.0) Thu Mar 27, 1997
|      Connected to 192.168.199.132 (192.168.199.132)
|      Waiting for user name
|      TYPE: ASCII, FORM: Nonprint; STRUcture: File; transfer MODE: Stream
|      No data connection
|_End of status
23/tcp  open  telnet     IRIX telnetd 6.X
25/tcp  open  smtp       Sendmail NX5.67g/NX3.0S
|_smtp-commands: SMTP: EHLO 500 Command unrecognized\x0D
37/tcp  open  time       (32 bits)
|_rfc868-time: 1997-05-30T03:42:03
79/tcp  open  finger     SGI IRIX or NeXTSTEP fingerd
| finger: Login       Name              TTY Idle    When            Office\x0D
| me       My Account            co  42d Thu 19:41 \x0D
|_me       My Account            p1      Thu 20:42 \x0D
111/tcp open  rpcbind    2 (RPC #100000)
512/tcp open  exec
513/tcp open  login
514/tcp open  tcpwrapped
515/tcp open  printer    lpd (path: /usr/lib/lpd; error: ....: Malformed from address)
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port21-TCP:V=7.80%I=7%D=12/20%Time=61C16FCE%P=x86_64-pc-linux-gnu%r(NUL
SF:L,4C,"220\x20openstep42\x20FTP\x20server\x20\(Version\x205\.1\x20\(NeXT
SF:\x201\.0\)\x20Thu\x20Mar\x2027,\x201997\)\x20ready\.\r\n")%r(GenericLin
SF:es,8E,"220\x20openstep42\x20FTP\x20server\x20\(Version\x205\.1\x20\(NeX
SF:T\x201\.0\)\x20Thu\x20Mar\x2027,\x201997\)\x20ready\.\r\n500\x20'':\x20
SF:command\x20not\x20understood\.\r\n500\x20'':\x20command\x20not\x20under
SF:stood\.\r\n")%r(Help,241,"220\x20openstep42\x20FTP\x20server\x20\(Versi
SF:on\x205\.1\x20\(NeXT\x201\.0\)\x20Thu\x20Mar\x2027,\x201997\)\x20ready\
SF:.\r\n214-\x20The\x20following\x20commands\x20are\x20recognized\x20\(\*\
SF:x20=>'s\x20unimplemented\)\.\r\n\x20\x20\x20USER\x20\x20\x20\x20PORT\x2
SF:0\x20\x20\x20STOR\x20\x20\x20\x20MSAM\*\x20\x20\x20RNTO\x20\x20\x20\x20
SF:NLST\x20\x20\x20\x20MKD\x20\x20\x20\x20\x20CDUP\x20\r\n\x20\x20\x20PASS
SF:\x20\x20\x20\x20PASV\x20\x20\x20\x20APPE\x20\x20\x20\x20MRSQ\*\x20\x20\
SF:x20ABOR\x20\x20\x20\x20SITE\x20\x20\x20\x20XMKD\x20\x20\x20\x20XCUP\x20
SF:\r\n\x20\x20\x20ACCT\*\x20\x20\x20TYPE\x20\x20\x20\x20MLFL\*\x20\x20\x2
SF:0MRCP\*\x20\x20\x20DELE\x20\x20\x20\x20SYST\x20\x20\x20\x20RMD\x20\x20\
SF:x20\x20\x20STOU\x20\r\n\x20\x20\x20SMNT\*\x20\x20\x20STRU\x20\x20\x20\x
SF:20MAIL\*\x20\x20\x20ALLO\x20\x20\x20\x20CWD\x20\x20\x20\x20\x20STAT\x20
SF:\x20\x20\x20XRMD\x20\x20\x20\x20SIZE\x20\r\n\x20\x20\x20REIN\*\x20\x20\
SF:x20MODE\x20\x20\x20\x20MSND\*\x20\x20\x20REST\x20\x20\x20\x20XCWD\x20\x
SF:20\x20\x20HELP\x20\x20\x20\x20PWD\x20\x20\x20\x20\x20MDTM\x20\r\n\x20\x
SF:20\x20QUIT\x20\x20\x20\x20RETR\x20\x20\x20\x20MSOM\*\x20\x20\x20RNFR\x2
SF:0\x20\x20\x20LIST\x20\x20\x20\x20NOOP\x20\x20\x20\x20XPWD\x20\r\n214\x2
SF:0Direct\x20comments\x20to\x20ftp-bugs@openstep42\.\r\n")%r(SSLSessionRe
SF:q,6F,"220\x20openstep42\x20FTP\x20server\x20\(Version\x205\.1\x20\(NeXT
SF:\x201\.0\)\x20Thu\x20Mar\x2027,\x201997\)\x20ready\.\r\n500\x20'\x16\x0
SF:3':\x20command\x20not\x20understood\.\r\n")%r(SMBProgNeg,4C,"220\x20ope
SF:nstep42\x20FTP\x20server\x20\(Version\x205\.1\x20\(NeXT\x201\.0\)\x20Th
SF:u\x20Mar\x2027,\x201997\)\x20ready\.\r\n");
Service Info: Host: localhost; OSs: Solaris, IRIX, Unix; CPE: cpe:/o:sun:sunos, cpe:/o:sgi:irix

Host script results:
|_clock-skew: -8971d02h30m50s

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 181.30 seconds
```

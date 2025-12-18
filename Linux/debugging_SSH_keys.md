# Debugging SSH keys

## List available host key algorithms on the client
```
$ ssh -Q key
ssh-ed25519
ssh-ed25519-cert-v01@openssh.com
sk-ssh-ed25519@openssh.com
sk-ssh-ed25519-cert-v01@openssh.com
ssh-rsa
ssh-dss
ecdsa-sha2-nistp256
ecdsa-sha2-nistp384
ecdsa-sha2-nistp521
sk-ecdsa-sha2-nistp256@openssh.com
ssh-rsa-cert-v01@openssh.com
ssh-dss-cert-v01@openssh.com
ecdsa-sha2-nistp256-cert-v01@openssh.com
ecdsa-sha2-nistp384-cert-v01@openssh.com
ecdsa-sha2-nistp521-cert-v01@openssh.com
sk-ecdsa-sha2-nistp256-cert-v01@openssh.com
```

If the client is too old to support the `-Q` flag, you can look at the manpage instead:
```
$ man ssh_config | grep -A 15 HostKeyAlgorithms
HostKeyAlgorithms
    Specifies the protocol version 2 host key algorithms that the client wants to use in order of preference.  The default for this option is:

    ecdsa-sha2-nistp256-cert-v01@openssh.com,
    ecdsa-sha2-nistp384-cert-v01@openssh.com,
    ecdsa-sha2-nistp521-cert-v01@openssh.com,
    ssh-rsa-cert-v01@openssh.com,ssh-dss-cert-v01@openssh.com,
    ssh-rsa-cert-v00@openssh.com,ssh-dss-cert-v00@openssh.com,
    ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,
    ssh-rsa,ssh-dss
```

---

## Check that the right private key is being used for authentication
[Specifying an IdentityFile with SSH](https://unix.stackexchange.com/a/494485)

You can ensure that the right private key is being used by specifying it yourself:
```
ssh -i ~/.ssh/{PRIVATE_KEY_FILE} {USERNAME}@{SERVER}
```
For example:
```
ssh -i ~/.ssh/id_ed25519 josh@gitlab.lan
```

If you are able to authenticate successfully without providing your password then you know that the key works and you need to tell your git client to authenticate with that key instead of whatever key it is currently using.


---

## Look at the SSH verbose logs
```
$ ssh git@{GIT_SERVER} -vvv
```
For example:
```
$ ssh josh@gitlab.lan -vvv
```

If you dig deeper into the logs, you'll see the following:
```
debug1: Next authentication method: publickey
debug1: Offering RSA public key: /root/.ssh/id_rsa_gitlab
debug3: send_pubkey_test
debug2: we sent a publickey packet, wait for reply
debug1: Authentications that can continue: publickey,gssapi-keyex,gssapi-with-mic,password,keyboard-interactive
debug1: Trying private key: /root/.ssh/id_rsa
debug3: no such identity: /root/.ssh/id_rsa: No such file or directory
debug1: Trying private key: /root/.ssh/id_dsa
debug3: no such identity: /root/.ssh/id_dsa: No such file or directory
debug1: Trying private key: /root/.ssh/id_ecdsa
debug3: no such identity: /root/.ssh/id_ecdsa: No such file or directory
debug1: Trying private key: /root/.ssh/id_ed25519
debug3: no such identity: /root/.ssh/id_ed25519: No such file or directory
debug2: we did not send a packet, disable method
debug3: authmethod_lookup keyboard-interactive
debug3: remaining preferred: password
debug3: authmethod_is_enabled keyboard-interactive
debug1: Next authentication method: keyboard-interactive
debug2: userauth_kbdint
debug2: we sent a keyboard-interactive packet, wait for reply
debug2: input_userauth_info_req
debug2: input_userauth_info_req: num_prompts 1
Password:
```
Since we don't see a line saying `Server accepts key:`, we know that the server is denying our request to use public key authentication.

Compare the above to an example of successful authentication on a different machine:
```
debug1: Next authentication method: publickey
debug1: Trying private key: /home/josh/.ssh/id_rsa
debug3: no such identity: /home/josh/.ssh/id_rsa: No such file or directory
debug1: Trying private key: /home/josh/.ssh/id_ecdsa
debug3: no such identity: /home/josh/.ssh/id_ecdsa: No such file or directory
debug1: Trying private key: /home/josh/.ssh/id_ecdsa_sk
debug3: no such identity: /home/josh/.ssh/id_ecdsa_sk: No such file or directory
debug1: Offering public key: /home/josh/.ssh/id_ed25519 ED25519 SHA256:hdF5ScDmBkOitSc+zzQr9T9JrMgJcWPIY4hSZOkOWhs
debug3: send packet: type 50
debug2: we sent a publickey packet, wait for reply
debug3: receive packet: type 60
debug1: Server accepts key: /home/josh/.ssh/id_ed25519 ED25519 SHA256:hdF5ScDmBkOitSc+zzQr9T9JrMgJcWPIY4hSZOkOWhs
debug3: sign_and_send_pubkey: using publickey with ED25519 SHA256:hdF5ScDmBkOitSc+zzQr9T9JrMgJcWPIY4hSZOkOWhs
debug3: sign_and_send_pubkey: signing using ssh-ed25519 SHA256:hdF5ScDmBkOitSc+zzQr9T9JrMgJcWPIY4hSZOkOWhs
debug3: send packet: type 50
debug3: receive packet: type 52
Authenticated to obsidian ([192.168.1.2]:22) using "publickey".
```

### Check the key algorithm of the key that you are using for authentication
```
$ cat ~/.ssh/id_rsa.pub
ssh-rsa ...
```

### Check the algorithms allowed by the server
By checking the host key algorithms you are able to see what algorithms the server will allow you to send:
```
$ ssh -vvv gitlab.lan
...
debug2: host key algorithms: rsa-sha2-512,rsa-sha2-256,ecdsa-sha2-nistp256,ssh-ed25519
```
On older versions of SSH it doesn't explicitly call out which are the host key algorithms, but they will still be visible in the logs:
```
$ ssh -vvv gitlab.lan
...
debug2: kex_parse_kexinit: first_kex_follows 0
debug2: kex_parse_kexinit: reserved 0
debug2: kex_parse_kexinit: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,sntrup761x25519-sha512@openssh.com,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256,kex-strict-s-v00@openssh.com
debug2: kex_parse_kexinit: rsa-sha2-512,rsa-sha2-256,ecdsa-sha2-nistp256,ssh-ed25519
```

### Compare the key algorithm you are using to the ones allowed by the server
After completing the above two steps, you can now compare
```
ssh-rsa
```
to
```
rsa-sha2-512,rsa-sha2-256,ecdsa-sha2-nistp256,ssh-ed25519
```

Since `ssh-rsa` isn't in the host key algorithms, we now know why the server is denying us.

---

## Check the server logs

If you have access to the server, connect to it and check the `sshd` logs to see if your key algorithm is being denied:
```
$ sudo grep Pubkey /var/log/auth.log
Jul  2 17:03:37 gitlab sshd[363811]: userauth_pubkey: key type ssh-rsa not in PubkeyAcceptedAlgorithms [preauth]
```

Here we can see that the client sent `ssh-rsa`, but the server does not accept this kind of algorithm.

If `/var/log/auth.log` doesn't exist then you can look in `journalctl` instead:
```
journalctl -u sshd -f
```

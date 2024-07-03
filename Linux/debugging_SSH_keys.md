# Debugging SSH keys

## List available host key algorithms
NOTE: This command should be run on the _client_
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

---

## Make sure you are using modern keys

If you have access to the server, connect to it and check the `sshd` logs to see if your key algorithm is being denied:
```
$ sudo grep Pubkey /var/log/auth.log
Jul  2 17:03:37 gitlab sshd[363811]: userauth_pubkey: key type ssh-rsa not in PubkeyAcceptedAlgorithms [preauth]
```

Here we can see that the client sent `ssh-rsa`, but the server does not accept this kind of algorithm.

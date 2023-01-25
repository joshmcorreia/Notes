# Salt Master

## Security
According to the SaltStack website, "a master that is open to the internet is considered a security vulnerability."

Make sure that the Salt Master accepts incoming connections on ports 4505 and 4506, but only from known IPs or IP ranges. Use proper access control lists to prevent random users on the internet from sending their minion keys to the Salt Master in an attempt to gain access to your network. This is especially crucial on systems where the Salt Master automatically accepts minion keys.

- [Preseed Minion with Accepted Key](https://docs.saltproject.io/en/latest/topics/tutorials/preseed_key.html)

---

## Auto accept minions from Grains
[Source](https://docs.saltproject.io/en/latest/topics/tutorials/autoaccept_grains.html)

### On the Salt Master
Edit `/etc/salt/master` and add the following line:
```
autosign_grains_dir: /etc/salt/autosign_grains
```

Create a file that matches the name of the grain you want to use. For this example, the grain will be called `uuid`
```
sudo mkdir /etc/salt/autosign_grains
sudo touch /etc/salt/autosign_grains/uuid
```

Open the file that matches the name of the grain
```
sudo vim /etc/salt/autosign_grains/uuid
```
then populate it with the values that you want to automatically accept (if you want to accept multiple values, put them on separate lines)
```
8f7d68e2-30c5-40c6-b84a-df7e978a03ee
```

### On the Salt Minion(s)

Edit the minion config file so that it knows to send the grain
```
sudo vim /etc/salt/minion
```
```
autosign_grains:
  - uuid
```

Now add that grain to the minion
```
sudo vim /etc/salt/grains
```
```
uuid: "8f7d68e2-30c5-40c6-b84a-df7e978a03ee"
```

---

## List minion keys
```
$ sudo salt-key -L
Accepted Keys:
Denied Keys:
Unaccepted Keys:
Rejected Keys:
```

## Accept all minion keys
[Source](https://docs.saltproject.io/en/latest/ref/cli/salt-key.html)
```
sudo salt-key -A
```

## Delete all minion keys
[Source](https://docs.saltproject.io/en/latest/ref/cli/salt-key.html)
```
sudo salt-key -D
```

## Delete a denied key
Denied keys are stored in `/etc/salt/pki/master/minions_denied/` as files and can be deleted like any other file.

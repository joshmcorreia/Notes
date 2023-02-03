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

---

## Accept all minion keys
[Source](https://docs.saltproject.io/en/latest/ref/cli/salt-key.html)
```
sudo salt-key -A
```

---

## Delete all minion keys
[Source](https://docs.saltproject.io/en/latest/ref/cli/salt-key.html)
```
sudo salt-key -D
```
---

## Delete a denied key
Denied keys are stored in `/etc/salt/pki/master/minions_denied/` as files and can be deleted like any other file.

---

## Ping all minions
```
sudo salt '*' test.ping
```

---

## Run a command on all minions
```
sudo salt '*' cmd.run "whoami"
```

To run a command as a specific user:
```
sudo salt '*' cmd.run "whoami" runas=josh
```

To run a command in the background:
```
sudo salt '*' cmd.run_bg "whoami"
```

---

## Update a grain value on all minions
```
sudo salt '*' grains.setval region us-west-1
```

---

## Print out a grain value for all minions
```
sudo salt '*' grains.get location
```

---

## Refresh the grains of all minions
If changes are made to a grain on a minion, the master will need to update the grain values for that minion.
```
sudo salt '*' saltutil.refresh_modules
```

---

## Target minions with specific grains
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/grains.html#targeting-with-grains)
```
sudo salt -G 'cpuarch:x86_64' test.ping
```

You can also target minions with custom grains in the same way:
```
sudo salt -G 'region:us-west-1' test.ping
```

---

## Compound minion targeting
Using [compound matchers](https://docs.saltproject.io/en/latest/topics/targeting/compound.html) you are able to create rather complex minion targeting methods.

This example shows how to target all minions that do not have the `region:us-west-1` grain
```
sudo salt -C 'not G@region:us-west-1' test.ping
```

This example shows how to target all but one minion
```
sudo salt -C 'not minion1' test.ping
```

---

## Kill a process on all minions
```
sudo salt '*' ps.pkill "nginx"
```
OR
```
sudo salt '*' ps.pkill "nginx" signal=9
```

---

## Search the process tree on all minions
```
sudo salt '*' ps.psaux "nginx"
```

---

## Check the disk usage on all minions
```
sudo salt '*' disk.percent /
```

---

## Copy a file to all minions
```
sudo salt-cp '*' defaults.cfg /home/josh/defaults.cfg
```

---

## Top files
[The Top File](https://docs.saltproject.io/en/latest/ref/states/top.html)

First enable the Top file by adding the following lines to `/etc/salt/master`
```
file_roots:
  base:
    - /srv/salt
```

Create the folder where our salt state files will reside
```
sudo mkdir /srv/salt
```

Create an example salt state file
```
sudo touch /srv/salt/examples.sls
```

Populate the salt state file
```
install vim:
  pkg.installed:
    - name: vim
```

Apply the salt state file
```
sudo salt '*' state.apply examples
```

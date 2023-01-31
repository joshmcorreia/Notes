# Pillars
[Documentation](https://docs.saltproject.io/salt/user-guide/en/latest/topics/pillar.html)

## What are pillars?
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/pillar.html#pillar-use-case)

Salt pillar brings data into the cluster from the opposite direction as grains. While grains data is generated from the minion, the pillar is data generated from the master.

Pillars are great for sending sensitive data, such as passwords, because the pillar data is encrypted on a per-minion basis with that minion's public key.

---

## How to set up pillar_roots
First you need to make a `pillar.conf` file
```
sudo touch /etc/salt/master.d/pillar.conf
```
Then copy/paste the following into it
```
pillar_roots:
  base:
    - /srv/pillar
```
This tells the Salt master that base pillar environment is located in `/srv/pillar`

---

## How to set up the top pillar
First create the directory
```
sudo mkdir /srv/pillar/
```
Then create the `top.sls` file
```
sudo touch /srv/pillar/top.sls
```
Then copy/paste the following into it:
```
base:
  '*':
    - server
```
In this example, `server` references the name of our `server.sls` pillar file which is basically a list of key/value pairs
```
server_hostname: bastion
```

---

## How to access a pillar within a state file
The [documentation](https://docs.saltproject.io/salt/user-guide/en/latest/topics/pillar.html#rendering-pillar) goes into greater detail, but it's as simple as calling a Python function in your state file

Here is an example state file
```
# /srv/salt/update_hostname.sls
update_hostname:
  cmd.run:
    - name: hostnamectl set-hostname {{ pillar['server_hostname'] }}
```

Now to apply the state file all you have to do is run the following command
```
sudo salt '*' state.apply update_hostname
```

Thanks to pillar substitution, the actual command that will be run on the minions is
```
hostnamectl set-hostname bastion
```

---

## How to pass a pillar value to a state file from the command line
[Source](https://stackoverflow.com/a/45045773)

Instead of having to update the pillar file, you can also pass the pillar on the fly
```
sudo salt '*' state.apply update_hostname pillar='{"server_hostname"="bastion"}'
```

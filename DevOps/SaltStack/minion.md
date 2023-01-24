## Connect to a Salt Master with a specific IP (config file method)
Update the `master.conf` file on each salt-minion
```
echo "master: 192.0.2.20" | sudo tee /etc/salt/minion.d/master.conf
```

Restart the salt-minion service after editing the file to apply the change
```
sudo systemctl restart salt-minion
```

## Connect to a Salt Master with a specific IP (hosts file method)
Update `/etc/hosts` to resolve "salt"
```
echo "192.0.2.20 salt" | sudo tee -a /etc/hosts
```

## Change the minion ID
[StackOverflow answer](https://stackoverflow.com/a/47650480)

The minion ID is based on the hostname during installation. This can be a problem if you're using an AMI with SaltStack installed because every minion will have the same minion ID and the overlap will cause all but one minion to be rejected.

This can be fixed by adding the following line to the user_data script:
```
hostname > /etc/salt/minion_id
```

Restart the salt-minion service after editing the file to apply the change
```
sudo systemctl restart salt-minion
```

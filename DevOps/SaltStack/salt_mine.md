# The Salt Mine
[The Salt Mine](https://docs.saltproject.io/en/latest/topics/mine/) allows you to store arbitrary information about minions on the master.

## Set a minion to return data to the Mine
[Source](https://docs.saltproject.io/en/latest/topics/mine/#mine-functions)

Edit your minion's config file
```
sudo vim /etc/salt/minion
```
and add the following lines to the end of the file:
```
mine_functions:
  network.fqdns: []
```
Then restart the salt minion:
```
sudo systemctl restart salt-minion
```

## Set the Mine interval:
Open the salt minion's config file
```
sudo vim /etc/salt/minion
```
and add the following line
```
mine_interval: 60
```
The `mine_interval` is in minutes, and by default it is set to 60.

## Force Mine data to update
[Source](https://docs.saltproject.io/en/latest/topics/mine/#example)
```
$ sudo salt '*' mine.update
ip-10-0-0-52:
    True
```

## Get specific Mine data from all minions
[Source](https://docs.saltproject.io/en/latest/ref/modules/all/salt.modules.mine.html#salt.modules.mine.get)
```
$ sudo salt '*' mine.get '*' network.fqdns
ip-10-0-0-52:
    ----------
    ip-10-0-0-52:
        ----------
        fqdns:
            - ip-10-0-0-52.ec2.internal
```

## List valid entries in a mine configuration
[Source](https://docs.saltproject.io/en/latest/ref/modules/all/salt.modules.mine.html#salt.modules.mine.valid)
```
$ sudo salt 'ip-10-0-0-52' mine.valid
ip-10-0-0-52:
    ----------
    network.fqdns:
```

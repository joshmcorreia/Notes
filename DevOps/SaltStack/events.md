# Events
[Watching Events](https://docs.saltproject.io/en/getstarted/event/events.html)

---

## Monitor events on the command line
```
sudo salt-run state.event pretty=True
```

An easy way to see some sample events is to run `sudo systemctl restart salt-minion` on one of the minions.

---

## Enable presence events
[Source](https://docs.saltproject.io/en/latest/ref/configuration/master.html#presence-events)

Presence events tell the Salt Master to periodically look for actively connected minions, essentially performing a health check. By default this happens once a minute.

By default this is disabled, but to enable it you need to add the following line to `/etc/salt/master` on the Salt Master
```
presence_events: True
```
then restart the `salt-master` service
```
sudo systemctl restart salt-master
```

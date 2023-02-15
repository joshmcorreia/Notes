# Events
[Watching Events](https://docs.saltproject.io/en/getstarted/event/events.html)

---

## Monitor events on the command line
```
sudo salt-run state.event pretty=True
```

An easy way to see some sample events is to run `sudo systemctl restart salt-minion` on one of the minions.

---

## Send a custom event from a minion to the master
[Source](https://docs.saltproject.io/en/getstarted/event/reactor.html)
```
sudo salt-call event.send 'my/custom/event/tag'
```
The following events will be sent to the Salt Master
```
my/custom/event/tag	{
    "_stamp": "2023-02-15T19:50:56.334875",
    "cmd": "_minion_event",
    "data": {
        "__pub_fun": "event.send",
        "__pub_jid": "20230215195055950683",
        "__pub_pid": 1141,
        "__pub_tgt": "salt-call"
    },
    "id": "ip-10-0-0-243",
    "tag": "my/custom/event/tag"
}
salt/job/20230215195056345172/ret/ip-10-0-0-243	{
    "_stamp": "2023-02-15T19:50:56.346387",
    "arg": [
        "my/custom/event/tag"
    ],
    "cmd": "_return",
    "fun": "event.send",
    "fun_args": [
        "my/custom/event/tag"
    ],
    "id": "ip-10-0-0-243",
    "jid": "20230215195056345172",
    "retcode": 0,
    "return": true,
    "tgt": "ip-10-0-0-243",
    "tgt_type": "glob"
}
```

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

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

## Send a custom event with data from a minion to the master
[Source](https://docs.saltproject.io/en/getstarted/event/custom.html)

You can also send event data along with the event tag
```
salt-call event.send /my/test/event '{"data": "my event test"}'
```
The following events will then appear in the Salt Master event log
```
/my/test/event	{
    "_stamp": "2023-02-17T18:47:20.094995",
    "cmd": "_minion_event",
    "data": {
        "__pub_fun": "event.send",
        "__pub_jid": "20230217184720076105",
        "__pub_pid": 22475,
        "__pub_tgt": "salt-call",
        "data": "my event test"
    },
    "id": "ip-10-0-0-108",
    "tag": "/my/test/event"
}
salt/job/20230217184720107480/ret/ip-10-0-0-108	{
    "_stamp": "2023-02-17T18:47:20.110437",
    "arg": [
        "/my/test/event",
        "{\"data\": \"my event test\"}"
    ],
    "cmd": "_return",
    "fun": "event.send",
    "fun_args": [
        "/my/test/event",
        "{\"data\": \"my event test\"}"
    ],
    "id": "ip-10-0-0-108",
    "jid": "20230217184720107480",
    "retcode": 0,
    "return": true,
    "tgt": "ip-10-0-0-108",
    "tgt_type": "glob"
}
```

---

## Send grains to the master during a minion start event
Sometimes you may want to send specific grains to the master when a minion starts up. This can be done using the [`start_event_grains` configuration](https://docs.saltproject.io/en/latest/ref/configuration/minion.html#start-event-grains) on the minion.

Open `/etc/salt/minion` on the minion and add the following lines:
```
start_event_grains:
  - fqdn_ip4
```

Now when the minion starts up and connects to the master you can look at the event log and see the following information:
```
[DEBUG   ] Sending event: tag = minion_start; data = {'id': 'ip-10-0-0-52', 'cmd': '_minion_event', 'pretag': None, 'data': 'Minion ip-10-0-0-52 started at Wed Apr 12 18:28:15 2023', 'tag': 'minion_start', 'grains': {'fqdn_ip4': ['10.0.0.52']}, '_stamp': '2023-04-12T18:28:24.852805'}
```

I have previously combined this with a reactor and orchestrator to allow me to add the IP address of a new minion to the config files of all other minions.

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

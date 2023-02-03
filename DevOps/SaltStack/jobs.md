# Jobs
[Source](https://docs.saltproject.io/en/latest/topics/jobs/index.html)

## List all active jobs
```
sudo salt-run jobs.active
```

## List jobs running on a specific minion
```
sudo salt <minion> saltutil.running
```

## Kill specific jobs
```
sudo salt <minion> saltutil.kill_job <jid>
```

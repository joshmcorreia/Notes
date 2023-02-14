# Jobs
[Source](https://docs.saltproject.io/en/latest/topics/jobs/index.html)

## List all active jobs
[Source](https://docs.saltproject.io/en/latest/topics/jobs/index.html#active)
```
sudo salt-run jobs.active
```

## List active jobs on a specific minion
[Source](https://docs.saltproject.io/en/latest/topics/jobs/index.html#functions-in-the-saltutil-module)
```
sudo salt <minion> saltutil.running
```

## Kill a specific job on a specific minion
[Source](https://docs.saltproject.io/en/latest/topics/jobs/index.html#functions-in-the-saltutil-module)
```
sudo salt <minion> saltutil.kill_job <jid>
```

## Kill all active jobs on a specific minion
[Source](https://docs.saltproject.io/en/latest/ref/modules/all/salt.modules.saltutil.html#salt.modules.saltutil.kill_all_jobs)
```
sudo salt <minion> saltutil.kill_all_jobs
```

## Kill all active jobs on all minions
[Source](https://docs.saltproject.io/en/latest/ref/modules/all/salt.modules.saltutil.html#salt.modules.saltutil.kill_all_jobs)
```
sudo salt '*' saltutil.kill_all_jobs
```

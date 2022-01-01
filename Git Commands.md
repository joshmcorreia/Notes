# Git Commands


## Automatically rebase while pulling:
```
git config pull.rebase true
```

## Automatically stash your changes when performing a rebase:
```
git config rebase.autoStash true
```

## Fetch all remote tags
```
git fetch --tags

# if there is a local tag that conflicts with remote, run this
git fetch --tags --force
```

## Delete a remote tag ([Source](https://stackoverflow.com/a/12791414))
```
git push --delete origin YOUR_TAG_NAME
```

## Create a branch
```
git checkout -b new_branch_name
```

## Push a branch to remote
```
git push origin new_branch_name
```

## Delete a remote branch
```
git push origin --delete build_branch
```

## Pull changes from master into current branch without adding a commit ([Source](https://stackoverflow.com/a/5340773))
```
git checkout <branch_name>
git rebase master
git push --force
```

## Revert to a specific commit on a remote branch ([Source](https://stackoverflow.com/a/41726152))
```
git checkout <branch_name>
git reset --hard <last_working_commit_id>
git push --force
```

## Delete a specific commit on a remote branch and remove it from git history ([Source](https://stackoverflow.com/a/40926981))
```
git rebase -i HEAD~x # where x is the number of commits back that you want to edit
# this opens up vim, replace "pick" with "drop" for the commit(s) that you wish to get rid of, then exit vim
git push --force-with-lease
```

## Get the latest tag for the current branch ([Source](https://stackoverflow.com/a/12791414))
```
git describe --tags --abbrev=0
```

## Check out a specific tag ([Source](https://stackoverflow.com/a/35979751))
```
git checkout tags/0.0.1
```

## Get remote url
```
git config --get remote.origin.url
```

## Set the remote url
```
git remote add origin git@bitbucket.org:josh/josh.git
```

## Delete references to branches that no longer exist on remote:
```
git remote prune origin
```

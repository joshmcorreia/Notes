# Git Commands

## Set the name used to publish commits:
```
git config --global user.name "FIRST_NAME LAST_NAME"
```

## Set the email used to publish commits:
```
git config --global user.email "MY_NAME@example.com"
```

## Automatically rebase while pulling:
```
git config pull.rebase true
```

## Automatically stash your changes when performing a rebase:
```
git config rebase.autoStash true
```

## Stash your changes
```
git stash

git stash --include-untracked # includes untracked files
```

## Resume your stash
```
git stash pop
```

## Delete all stashes
```
git stash clear
```

## Create a branch
```
git checkout -b new_branch_name
```

## Push a branch to remote
```
git push origin new_branch_name
```

## Delete all local branches except master ([Source](https://stackoverflow.com/a/58139363))
```
git branch | grep -v "master" | xargs git branch -D
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

## Undo a commit and keep the changes ([Source](https://stackoverflow.com/a/15772171))
```
# this command can be performed multiple times to undo multiple commits and keep their changes
git reset HEAD^
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
---

# Tags:

## Fetch all remote tags
```
git fetch --tags

# if there is a local tag that conflicts with remote, run this
git fetch --tags --force
```

## List all tags
```
git tag
```

## Tag the latest commit
```
git tag v1.2
```

## Tag a specific commit ([Source](https://stackoverflow.com/a/4404197))
```
git tag -a v1.2 9fceb02 -m "Message here"
```

## Delete a local tag
```
git tag -d 1.0
```

## Delete a remote tag ([Source](https://stackoverflow.com/a/12791414))
```
git push --delete origin YOUR_TAG_NAME
```

## Get the latest tag for the current branch ([Source](https://stackoverflow.com/a/12791414))
```
git describe --tags --abbrev=0
```

## Check out a specific tag ([Source](https://stackoverflow.com/a/35979751))
```
git checkout tags/0.0.1
```

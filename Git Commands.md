# Git

## What is the best way to use Git?
Of course there is never a solution that works for all problems, but the "[successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)" by Vincent Driessen is a very useful guide to follow.

## What is a tag?
The best explanation of tags that I've read is that a "tag is just an annotated pointer to a commit" ([Source](https://softwareengineering.stackexchange.com/a/165733)).

## Should you use tags on branches?
In general I've found that it's best to only use tags on the branch that you release from, which is generally `master/main`. Since tags are applied to specific commits, if you delete a branch, the tags on that branch are deleted as well. When squashing commits during a merge you will also lose those tags, so even if you keep the branch around, that tag will not exist on the `main` branch. Relevant resources [here](https://softwareengineering.stackexchange.com/questions/347525/should-a-release-branch-or-the-master-branch-be-tagged-when-the-gitflow-is-used) and [here](https://stackoverflow.com/questions/54281360/what-happens-to-tags-of-squashed-commits).

---

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

## Get the hash of the current commit ([Source](https://stackoverflow.com/a/949391))
```
git rev-parse HEAD
> 1ed246bc3e3159d1339886c004c37c11b47e37cd

git rev-parse --short HEAD
> 1ed246bc
```

## Create a branch
```
git checkout -b new_branch_name
```

## Push a branch to remote
```
git push origin new_branch_name
```

## Overwrite a remote branch
```
git push origin newBranch:oldBranch
```
[Source](https://stackoverflow.com/a/39389793)

## Back up a branch
```
git checkout my_branch # check out the branch you want to back up
git checkout -b my_branch_backup # back up the branch
git checkout my_branch # switch back to the branch you backed up
```
[Source](https://docs.gitlab.com/ee/topics/git/git_rebase.html#git-rebase)

## Delete all local branches except master ([Source](https://stackoverflow.com/a/58139363))
```
git branch | grep -v "master" | xargs git branch -D
```

## Delete a local branch
```
git branch -d build_branch
```

## Force delete a local branch
```
git branch -D build_branch
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

## Force LF line endings on Windows:
[Source](https://stackoverflow.com/a/13154031)
```
git config --global core.autocrlf false
git config --global core.eol lf
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

git tag -a v1.2 -m "Version 1.2 release"
```

## Tag a specific commit ([Source](https://stackoverflow.com/a/4404197))
```
git tag v1.2 9fceb02

git tag -a v1.2 9fceb02 -m "Version 1.2 release"
```

## Push a tag to remote ([Source](https://stackoverflow.com/a/5195913))
```
git push origin <tag_name>

Example:
git tag v1.2
git push origin v1.2
```

## Delete a local tag
```
git tag -d 1.0
```

## Delete a remote tag ([Source](https://stackoverflow.com/a/12791414))
```
git push --delete origin YOUR_TAG_NAME
```

## Get the latest tag for the current branch ([Source](https://stackoverflow.com/a/7261049))
```
git describe --tags --abbrev=0
```

## Get the latest tag across all branches ([Source](https://stackoverflow.com/a/7979255))
```
git describe --tags $(git rev-list --tags --max-count=1)
```

## Get the latest annotated tag ([Source](https://stackoverflow.com/a/7261049))
```
git describe --abbrev=0
```

## Check out a specific tag ([Source](https://stackoverflow.com/a/35979751))
```
git checkout tags/0.0.1
```

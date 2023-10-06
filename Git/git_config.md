# Git Config

---

# System vs Global vs Local Configs

## View the global config:
```
$ cat ~/.gitconfig
[core]
        autocrlf = false
        eol = lf
        editor = vim
[user]
        email = joshmcorreia@example.com
        name = Josh Correia
```

## View the local config:
```
$ cat ~/REPO_NAME/.git/config
[core]
        repositoryformatversion = 0
        filemode = false
        bare = false
        logallrefupdates = true
        ignorecase = true
        autocrlf = false
[remote "origin"]
        url = git@github.com:joshmcorreia/Notes.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
        remote = origin
        merge = refs/heads/main
```

---

# User Information

## Set the global name used to publish commits:
```
git config --global user.name "Josh Correia"
```

## Set the global email used to publish commits:
```
git config --global user.email "joshmcorreia@example.com"
```

## View the name being used for commits:
```
$ git config user.name
Josh Correia
```

## View the email being used for commits:
```
$ git config user.email
joshmcorreia@example.com
```

## Debug commit and author emails:
Sometimes when dealing with rebasing or working with multiple emails you can get into scenarios where the author email and commit email are misaligned. This can be debugged with the following command:
```
$ git log --format=fuller
commit 42d718456f18b002191b9340616f89b0bcb69497 (HEAD -> feature/josh_test)
Author:     Josh Correia <joshcorreia@example.com>
AuthorDate: Fri Oct 6 10:22:11 2023 -0700
Commit:     Josh Correia <joshcorreiaold@example.com>
CommitDate: Fri Oct 6 10:22:11 2023 -0700

    Add stuff
```

---

## Automatically rebase while pulling:
```
git config pull.rebase true
```

## Automatically stash your changes when performing a rebase:
```
git config rebase.autoStash true
```

## Force LF line endings on Windows:
[Source](https://stackoverflow.com/a/13154031)
```
git config --global core.autocrlf false
git config --global core.eol lf
```

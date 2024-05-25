# Git Dates
[git-log Documentation](https://git-scm.com/docs/git-log)

---

## Get the commit that added a specific file
[How to find the commit in which a given file was added?](https://stackoverflow.com/a/13598028)
```
git log --diff-filter=A -- foo.js
```

There is also a handy alias for this:
```
git config --global alias.whatadded "log --diff-filter=A"
git whatadded -- foo.js
```

---

## Get the date of the first commit for a file
```
$ git log --diff-filter=A --format=%cd -- README.md
Mon Jan 3 17:51:28 2022 -0600
```

---

## Get the year of the first commit for a file
```
$ git log --diff-filter=A --date=format:'%Y' --format=%cd -- README.md
2022
```

---

## Get the date of the latest commit for a file
```
$ git log -1 --format=%cd README.md
Wed Sep 14 11:57:40 2022 -0500
```

---

## Get the year of the latest commit for a file
```
$ git log -1 --date=format:'%Y' --format=%cd README.md
2022
```

# Environment variables:

---

## Print all environment variables:
Note: this is shell specific and will have different output depending on the shell, works in `bash` and `zsh`
```
printenv
```
OR
```
env
```
OR
```
declare -xp
```

---

## Why use environment variables instead of config files?
One of the most common reasons I've seen for using environment variables is that you avoid version control so you never have to worry about checking secrets into a repo.

---

## direnv
[direnv](https://github.com/direnv/direnv) is an attempt at making it so that environment variables are bound to a directory instead of being global. This provides an additional layer of security.

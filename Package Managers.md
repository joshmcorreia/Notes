# Package-Managers
A list of commands for common package managers

---

# dnf

```
# list the package info of a specific package
dnf info gcc

# list all installed packages
dnf list

# list all installed packages containing the specified string
dnf list | grep gcc

# install a specific package
dnf install gcc

# update all packages to the latest version
Note: used to be `dnf update` but is now an alias to `dnf upgrade`
dnf upgrade

# update a specific package to the latest version
dnf upgrade gcc
```

# Package-Managers
A list of commands for common package managers

---
# pip3

### Upgrade pip3:
```
python3 -m pip install --upgrade pip
```

### List the package info of a specific package:
```
pip3 show coloredlogs
```

### Get the location of where a package is installed:
```
pip3 show coloredlogs | grep Location
```

### List all installed packages:
```
pip3 list
```

### List all installed packages containing the specified string:
```
pip3 list | grep coloredlogs
```

### Install a package:
```
pip3 install coloredlogs
```

### Uninstall a package:
```
pip3 uninstall coloredlogs
```

### Update all packages to the latest version:
[Source](https://stackoverflow.com/a/3452888/7487335)
```
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
```

### Update a specific package to the latest version:
```
pip3 install -U coloredlogs
```

---

# dnf (Dandified YUM)

### List the package info of a specific package:
```
dnf info gcc
```

### List all installed packages:
```
dnf list
```

### List all installed packages containing the specified string:
```
dnf list | grep gcc
```

### Install a package:
```
dnf install gcc
```

### Uninstall a package:
```
dnf remove gcc
```

### Update all packages to the latest version:
```
Note: used to be `dnf update` but is now an alias to `dnf upgrade`
dnf upgrade
```

### Update a specific package to the latest version:
```
dnf upgrade gcc
```

---

# rpm (RPM Package Manager)

### List the package info of a specific package:
```
rpm -qi gcc
```

### List all installed packages:
```
rpm -qa
```

### List all installed packages containing the specified string:
```
rpm -qa | grep gcc
```

### List all files installed by a specific package:
```
rpm -ql gcc
```

### Install a package:
```
rpm -i gcc
```

### Uninstall a package:
```
rpm -e gcc
```

### List all outdated packages:
```

```

### Update all packages to the latest version:
```

```

### Update a specific package to the latest version:
```
rpm -U gcc
```

---

# npm (Node Package Manager)

Note: Any of the following can be run with the `-g` flag which uses the global package manager
The commands `ls` and `list` are interchangeable.

### List the package info of a specific package:
```
npm -g ls puppeteer
```

### List all installed packages:
```
npm -g ls
```

### List all installed packages containing the specified string:
```
npm -g ls | grep 'beautify'
```

### Install a package:
```
npm -g install puppeteer
```

### Uninstall a package:
```
npm -g uninstall puppeteer
```

### List all outdated packages:
```
npm -g outdated
```

### Update all packages to the latest version:
```
npm -g update
```

### Update a specific package to the latest version:
```
npm -g update puppeteer
```

---

# Yarn
Yarn is a package/project manager for node

### List the package info of a specific package:
```
yarn list --pattern puppeteer
```
OR
```
yarn why puppeteer
```

### List all installed packages:
```
yarn list
```

### List all installed packages containing the specified string:
```
yarn list | grep 'babel'
```

### Install a package:
```
yarn add puppeteer
```

### Uninstall a package:
```
yarn remove puppeteer
```

### List all outdated packages:
```
yarn outdated
```

### Update all packages to the latest version:
```
yarn upgrade
```

### Update a specific package to the latest version:
```
yarn upgrade puppeteer
```

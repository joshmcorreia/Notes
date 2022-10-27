# Package-Managers
A list of commands for common package managers

---
# pip3

### Upgrade pip3
```
python3 -m pip install --upgrade pip
```

### List the package info of a specific package
```
pip3 show coloredlogs
```

### Get the location of where a package is installed
```
pip3 show coloredlogs | grep Location
```

### List all installed packages
```
pip3 list
```

### List all installed packages containing the specified string
```
pip3 list | grep coloredlogs
```

### Install a package
```
pip3 install coloredlogs
```

### Uninstall a package
```
pip3 uninstall coloredlogs
```

### Update all packages to the latest version
[Source](https://stackoverflow.com/a/3452888/7487335)
```
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
```

### Update a specific package to the latest version
```
pip3 install -U coloredlogs
```

---

# apt

### List the package info of a specific package
```
apt info gcc
```

### List all packages that depend on the specified package
```
apt-cache rdepends gcc
```

### List all dependencies of a package
```
apt-cache depends gcc
```

### List all installed packages
```
apt list --installed
```

### List all installed packages containing the specified string
```
apt list --installed | grep gcc
```

### Install a package
```
apt install gcc
```

### Install a package and its dependencies
```

```

### Uninstall a package
```
apt remove gcc
```

### Fetch the list of available updates
```
apt update
```

### Update all packages to the latest version
```
apt upgrade
```

### Update a specific package to the latest version
```
apt install --only-upgrade gcc
```

---

# dnf (Dandified YUM)

### List the package info of a specific package
```
dnf info gcc
```

### List all dependencies of a package
```
dnf repoquery --requires gcc
```

### List all installed packages
```
dnf list
```

### List all installed packages containing the specified string
```
dnf list | grep gcc
```

### Install a package
```
dnf install gcc
```

### Install a package and its dependencies
`dnf` doesn't have any special flags for this, you will automatically be prompted to install dependencies when installing a package

### Uninstall a package
```
dnf remove gcc
```

### Update all packages to the latest version
```
Note: used to be `dnf update` but is now an alias to `dnf upgrade`
dnf upgrade
```

### Update a specific package to the latest version
```
dnf upgrade gcc
```

### List all repos
```
dnf repolist

dnf repolist --enabled

dnf repolist --disabled
```

### Disable a repo
```
dnf config-manager --set-disabled repository
```

---

# rpm (RPM Package Manager)

### List the package info of a specific package
```
rpm -qi gcc
```

### List all dependencies of a package
```
# for a local `.rpm` file
rpm -qp --requires gcc.rpm

# for an installed package
rpm -q --requires gcc
```

### List all installed packages
```
rpm -qa
```

### List all installed packages containing the specified string
```
rpm -qa | grep gcc
```

### List all files installed by a specific package
```
rpm -ql gcc
```

### Install a package
```
rpm -ivh gcc
```

### Install a package and its dependencies
`rpm` does not have a built-in way to manage dependencies. You will need to use either `dnf` or `yum` to automatically install dependencies

### Uninstall a package
```
rpm -e gcc
```

### List all outdated packages
```

```

### Update all packages to the latest version
```

```

### Update a specific package to the latest version
```
rpm -Uvh gcc
```

---

# npm (Node Package Manager)

Note: Any of the following can be run with the `-g` flag which uses the global package manager
The commands `ls` and `list` are interchangeable.

### List the package info of a specific package
```
npm -g ls puppeteer
```

### List all dependencies of a package
```
npm list puppeteer
```

### List all installed packages
```
npm -g ls
```

### List all installed packages containing the specified string
```
npm -g ls | grep 'beautify'
```

### Install a package
```
npm -g install puppeteer
```

### Install a package and its dependencies
```

```

### Uninstall a package
```
npm -g uninstall puppeteer
```

### List all outdated packages
```
npm -g outdated
```

### Update all packages to the latest version
```
npm -g update
```

### Update a specific package to the latest version
```
npm -g update puppeteer
```

---

# Yarn
Yarn is a package/project manager for node

### List the package info of a specific package
```
yarn list --pattern puppeteer
```
OR
```
yarn why puppeteer
```

### List all dependencies of a package
```

```

### List all installed packages
```
yarn list
```

### List all installed packages containing the specified string
```
yarn list | grep 'babel'
```

### Install a package
```
yarn add puppeteer
```

### Install a package and its dependencies
```

```

### Uninstall a package
```
yarn remove puppeteer
```

### List all outdated packages
```
yarn outdated
```

### Update all packages to the latest version
```
yarn upgrade
```

### Update a specific package to the latest version
```
yarn upgrade puppeteer
```

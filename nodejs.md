# NodeJS Info

This guide contains multiple ways to install NodeJS, as well as how to install node package manager.

*Note: only use one of these install methods, if you use multiple you'll end up with multiple node installations which is confusing and hard to debug*

---

## Prerequisites:

### Install npm
Note: this step is dependent on your operating system
```
sudo apt install npm -y
```
Note: `i` and `install` are interchangeable within npm

---

## `n` npm package

### Install the `n` package
```
npm -g install n
```

### Install nodejs
```
n stable
```

### Update nodejs
```
n stable
```

### List current nodejs version
```
node -v
```

### List installed nodejs versions
```
n ls
```

### Switch to another installed nodejs version
```
n
```

---

## NVM (Node Version Manager)
[Source](https://github.com/nvm-sh/nvm)

### Install `nvm`
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

### Install nodejs
```
nvm install node
```

### Update nodejs
```
nvm install node --reinstall-packages-from=node
```

### List current nodejs version
```
node -v
```

### List installed nodejs versions
```
nvm ls
```

### Switch to another installed nodejs version
```
nvm use 8.10.0
```

---

## apt-get

### Install nodejs
Note: not recommended, because this often installs an out-of-date version
```
sudo apt-get install nodejs
```

### List current nodejs version
```
nodejs -v
```

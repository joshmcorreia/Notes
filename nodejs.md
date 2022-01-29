# NodeJS Info

*Note: only use one of these, if you use multiple you'll end up with multiple node installs which is confusing and hard to debug*

---

## `n` npm package
Note: `i` and `install` are interchangeable within npm

### Install npm
Note: this step is dependent on your operating system
```
sudo apt install npm -y
```

### Install nodejs
```
npm -g install n
n stable
```

### List current nodejs version
```
node -v
```

### Update nodejs
```
n stable
```

### Switch to another installed nodejs version
```
n
```

---

## NVM (Node Version Manager)

TODO


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

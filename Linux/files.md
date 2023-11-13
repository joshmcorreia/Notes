# Display file information:

### Get the architecture of an executable:
```
file output.txt
```

### Get the Access/Modify/Change/Birth times of a file:
```
stat output.txt
```

---

# Display file sizes:

### Single file:
[Source](https://stackoverflow.com/a/11720900/7487335)
```
ls -sh file.txt
```

### Each file in a directory:
[Source](https://stackoverflow.com/a/35439802/7487335)
```
ls -lh /var/log/josh
```

### Display disk usage:
```
du -sh /var/log/josh
```

---

# Find files:

### Find a specific file given the filename:
```
find / -name "josh.txt" 2>/dev/null
```

### Find all files with a specific extension:
```
find / -name *.txt 2>/dev/null

NOTE: in zsh you need to put quotes around the wildcard to prevent glob expansion
find / -name '*.txt' 2>/dev/null
```

### Find all files containing a certain string in the filename:
```
sudo find / -name "*josh*" 2>/dev/null
```

### Find files that changed in the last 24 hours
[Source](https://stackoverflow.com/a/16086041)
```
find / -mtime -1 -ls
```
OR
```
find / -mmin -1440 -ls
```

---

# View files:

### Print out the contents of a file:
```
cat file.txt
```

### View the hexdump of a file as characters:
```
hexdump -c file.txt
```

### View the hexdump of a file as hex:
```
hexdump -C file.txt
```

### Output the end of a file:
```
tail file.txt
```

### Output the last X lines of a file:
```
tail -200 file.txt
```

### Output data that's appended to a file:
```
tail -f file.txt
```

### Output data that's appended to a file and exclude lines that contain a specific word:
```
tail -f file.txt | grep -v "DEBUG"
```

---

# Edit files:

### Empty the contents of a file:
[Source](https://unix.stackexchange.com/a/88810/340031)
```
truncate -s 0 file.txt
```

### Overwrite a file with text:
[Source](https://unix.stackexchange.com/a/88810/340031)
```
echo "text" > file.txt
```

### Append to the end of a file:
[Source](https://unix.stackexchange.com/a/88810/340031)
```
echo "text" >> file.txt
```

---

# File creation:

### Create a file of arbitrary size
[Source](https://ostechnix.com/create-files-certain-size-linux/)
```
head -c 5MB /dev/urandom > test_5mb_file.txt
```

---

# File ownership/permissions:

### Set file permissions:
```
chmod 750 file.txt
```

### Recursively set file permissions:
```
sudo chmod -R 750 /var/log/josh
```

### Change the owner of a file:
```
chown josh file.txt
```

### Recursively change the owner of a file:
```
chown -R josh /var/log/josh
```

### Print out the user who owns a file:
```
stat -c "%U" file.txt
```

### Print out the group that owns a file:
```
stat -c "%G" file.txt
```

### Find all directories with the sticky bit set:
```
find / -perm -1000 2>/dev/null
```

### Find all directories with the setgid bit set:
```
find / -perm -2000 2>/dev/null
```

### Find all directories with the setuid bit set:
```
find / -perm -4000 2>/dev/null
```

---

# File redirection:

### Redirect errors to devnull:
```
2>/dev/null
```

---
# List open files:

### List open files:
```
lsof
```

### Count how many files are open:
```
lsof | wc -l
```

### List files opened by a specific user:
```
lsof -u josh
```

### List all network connections:
```
lsof -i
```

### List processes running on a specific port:
```
lsof -i TCP:22
```

### Search files by PID:
```
lsof -p 1337
```

### Kill all processes of a specific user:
```
kill -9 `lsof -t -u josh`
```

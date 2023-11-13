# SCP - Secure Copy

### Copy from a local machine to a remote machine:
```
scp file.txt remote_username@10.10.0.2:/remote/directory
```

### Copy from a remote machine to your local machine:
```
scp remote_username@10.0.0.1:/home/josh/file.txt .
```

### Copy between two remote machines using local credentials:
Use this when two machines aren't able to communicate with each other but a third machine can communicate with both of them. I have found this useful in CI/CD pipelines when needing to transfer files when you don't want to allow two machines to communicate for security reasons.

[How to transfer a file between two remote servers using scp from a third, local machine?](https://stackoverflow.com/a/37790702)
```
scp -3 user1@remote1:/home/user1/file1.txt user2@remote2:/home/user2/file1.txt
```

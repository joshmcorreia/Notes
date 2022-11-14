# AWS User Data

### Run user-data as a non-root user
[Source](https://stackoverflow.com/questions/31157432/login-using-ec2-user-instead-of-root-using-user-data-in-aws)
```
#!/bin/bash
su josh -c "whoami"
```

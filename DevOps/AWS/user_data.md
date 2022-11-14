# AWS User Data

### Run user-data as a non-root user
[Source](https://stackoverflow.com/questions/31157432/login-using-ec2-user-instead-of-root-using-user-data-in-aws)
```
#!/bin/bash
su josh -c "whoami"
```

### Run user-data every time the instance starts
[Source](https://aws.amazon.com/premiumsupport/knowledge-center/execute-user-data-ec2/)
```
Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"

#!/bin/bash
su josh -c "whoami"
--//--
```

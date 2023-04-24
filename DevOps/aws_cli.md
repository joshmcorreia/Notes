# AWS CLI

## Install Instructions
Install instructions can be found [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## Configure AWS Credentials
[AWS CLI Configuration Basics](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

To set up your credentials, type the following:
```
aws configure
```

## Deregister an AMI
[Source](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/deregister-image.html)
```
aws ec2 deregister-image --image-id ami-4fa54026
```

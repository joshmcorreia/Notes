# AWS CLI

## Install Instructions
Install instructions can be found [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## Configure AWS Credentials
[AWS CLI Configuration Basics](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

To set up your credentials, type the following:
```
aws configure
```

## List all of your AMIs
[Source](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-filter.html)
```
aws ec2 describe-images --owners self
```

## List all of your AMIs and filter by name
[Source](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-filter.html)
```
aws ec2 describe-images --owners self --filters "Name=name,Values=salt_minion_ubuntu*"
```

## List all of your AMIs and filter by tag key
[Source](https://stackoverflow.com/a/40397970)

This example will return all AMIs owned by you that have a tag with the key `gitlab_pipeline_id`
```
aws ec2 describe-images --owners self --filters "Name=tag-key,Values=gitlab_pipeline_id"
```

## List all of your AMIs and filter by tag value
This example will return all AMIs owned by you that have a tag with the value `123`
```
aws ec2 describe-images --owners self --filters "Name=tag-value,Values=123"
```

## Deregister an AMI
[Source](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/deregister-image.html)
```
aws ec2 deregister-image --image-id ami-4fa54026
```


# Terraform SSH Keys

## Using existing SSH public key
This will allow you to use an SSH key that you generated locally. By default this can be found in `~/.ssh/id_rsa.pub`

**NOTE:** You will also need to configure the security group to allow inbound traffic on port 22
```
### File: main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
  key_name = aws_key_pair.josh_ssh_key.key_name

  tags = {
    Name = "JoshsTestServerInstance"
  }
}

resource "aws_key_pair" "josh_ssh_key" {
  key_name   = "josh_ssh_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/DZ6sNivAh96i75jv7ly2LTJ2lNd8x5XC0eIIXpg+BeTOoRAt5+o35zV9HcMgpA5qk6hy2GfDR8C3EUlYKQDdZYq3Ypee+1UafqUKf0T655K/vV9C29Y50Eca9s592Wj6g7vC0vMz90tiOuvWlLVmx3nGORd6Zeqz4SfXdHYQqI0uTIguFPbXewS4UrkeuscakjDicABgZwaN3iu6BxFLKK9xuuis5UdAnMvPoygpyFzuddAFaVByvN2+kRrY9nlbjBI9AlhqOrMkxu8+AeDYCcOn22u9tRFhHiIMVHM5l9y9O+E4yHwZ4eg03fSjfXugA5sQQztuUIlXNtQpJPtCzAqZFC/Pjk2fqM6UzIa6FjRt5z+MfUq0RASDKTI1yIAG+SZJGWqPAa7N1uIpJ5d6VVpdlne+VBbb95el4w/plOpU4GeWUwDa+gd4i0C4j76NODRE49b6FTtUkzlQs0f7sakqpCmKapX1+WalLp+HMpxs7GTynH34qERSnJqJUp8= josh@Joshs-MacBook-Pro.local"
}
```

## Using multiple existing SSH public keys
Amazon EC2 does not currently allow you to specify multiple keys, so we'll have to add the additional keys with user_data.

**NOTE:** You will also need to configure the security group to allow inbound traffic on port 22
```
### File: main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
  key_name = aws_key_pair.josh_ssh_key.key_name
  user_data = file("user_data.txt")

  tags = {
    Name = "JoshsTestServerInstance"
  }
}

resource "aws_key_pair" "josh_ssh_key" {
  key_name   = "josh_ssh_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/DZ6sNivAh96i75jv7ly2LTJ2lNd8x5XC0eIIXpg+BeTOoRAt5+o35zV9HcMgpA5qk6hy2GfDR8C3EUlYKQDdZYq3Ypee+1UafqUKf0T655K/vV9C29Y50Eca9s592Wj6g7vC0vMz90tiOuvWlLVmx3nGORd6Zeqz4SfXdHYQqI0uTIguFPbXewS4UrkeuscakjDicABgZwaN3iu6BxFLKK9xuuis5UdAnMvPoygpyFzuddAFaVByvN2+kRrY9nlbjBI9AlhqOrMkxu8+AeDYCcOn22u9tRFhHiIMVHM5l9y9O+E4yHwZ4eg03fSjfXugA5sQQztuUIlXNtQpJPtCzAqZFC/Pjk2fqM6UzIa6FjRt5z+MfUq0RASDKTI1yIAG+SZJGWqPAa7N1uIpJ5d6VVpdlne+VBbb95el4w/plOpU4GeWUwDa+gd4i0C4j76NODRE49b6FTtUkzlQs0f7sakqpCmKapX1+WalLp+HMpxs7GTynH34qERSnJqJUp8= josh@Joshs-MacBook-Pro.local"
}

```
And here is the `user_data.txt` file. For each additional public key all you need to do is add an echo statement with the public key.
```
#!/bin/bash
echo "AAAAB3NzaC1yc2EAAAADAQABAAABgQC/DZ6sNivAh96i75jv7ly2LTJ2lNd8x5XC0eIIXpg+BeTOoRAt5+o35zV9HcMgpA5qk6hy2GfDR8C3EUlYKQDdZYq3Ypee+1UafqUKf0T655K/vV9C29Y50Eca9s592Wj6g7vC0vMz90tiOuvWlLVmx3nGORd6Zeqz4SfXdHYQqI0uTIguFPbXewS4UrkeuscakjDicABgZwaN3iu6BxFLKK9xuuis5UdAnMvPoygpyFzuddAFaVByvN2+kRrY9nlbjBI9AlhqOrMkxu8+AeDYCcOn22u9tRFhHiIMVHM5l9y9O+E4yHwZ4eg03fSjfXugA5sQQztuUIlXNtQpJPtCzAqZFC/Pjk2fqM6UzIa6FjRt5z+MfUq0RASDKTI1yIAG+SZJGWqPAa7N1uIpJ5d6VVpdlne+VBbb95el4w/plOpU4GeWUwDa+gd4i0C4j76NODRE49b6FTtUkzlQs0f7sakqpCmKapX1+WalLp+HMpxs7GTynH34qERSnJqJUp8= josh@Joshs-MacBook-Pro.local" >> /home/ubuntu/.ssh/authorized_keys
chown ubuntu: /home/ubuntu/.ssh/authorized_keys
chmod 0600 /home/ubuntu/.ssh/authorized_keys
```

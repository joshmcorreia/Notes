# Terraform S3 Buckets

## Storing .tfstate in an S3 bucket
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

  # you have to manually create this S3 bucket in AWS before this will work
  backend "s3" {
    bucket = "terraform-state-s3-bucket-1234" # must be unique across all of AWS
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
```

# aws_instance

[Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

## Change the root block volume size of an AWS instance
[Source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#ebs-ephemeral-and-root-block-devices)
```
resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_size = 20
  }
}
```

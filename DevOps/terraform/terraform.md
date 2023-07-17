# Terraform

### What is it?
HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. You can then use a consistent workflow to provision and manage all of your infrastructure throughout its lifecycle. Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.

[Source](https://www.terraform.io/intro)

### Terraform Block
The `terraform {}` block contains Terraform settings, including the required providers Terraform will use to provision your infrastructure. For each provider, the source attribute defines an optional hostname, a namespace, and the provider type. Terraform installs providers from the [Terraform Registry](https://registry.terraform.io/) by default. In this example configuration, the `aws` provider's source is defined as `hashicorp/aws`, which is shorthand for `registry.terraform.io/hashicorp/aws`.

You can also set a version constraint for each provider defined in the `required_providers` block. The `version` attribute is optional, but we recommend using it to constrain the provider version so that Terraform does not install a version of the provider that does not work with your configuration. If you do not specify a provider version, Terraform will automatically download the most recent version during initialization.

To learn more, reference the [provider source documentation](https://www.terraform.io/language/providers/requirements).

[Source](https://learn.hashicorp.com/tutorials/terraform/aws-build)

### Providers
The `provider` block configures the specified provider, in this case `aws`. A provider is a plugin that Terraform uses to create and manage your resources.

You can use multiple provider blocks in your Terraform configuration to manage resources from different providers. You can even use different providers together. For example, you could pass the IP address of your AWS EC2 instance to a monitoring resource from DataDog.

[Source](https://learn.hashicorp.com/tutorials/terraform/aws-build)

### Resources
Use `resource` blocks to define components of your infrastructure. A resource might be a physical or virtual component such as an EC2 instance, or it can be a logical resource such as a Heroku application.

Resource blocks have two strings before the block: the resource type and the resource name. In this example, the resource type is `aws_instance` and the name is `app_server`. The prefix of the type maps to the name of the provider. In the example configuration, Terraform manages the `aws_instance` resource with the `aws` provider. Together, the resource type and resource name form a unique ID for the resource. For example, the ID for your EC2 instance is `aws_instance.app_server`.

Resource blocks contain arguments which you use to configure the resource. Arguments can include things like machine sizes, disk image names, or VPC IDs. Our [providers reference](https://www.terraform.io/language/providers) lists the required and optional arguments for each resource. For your EC2 instance, the example configuration sets the AMI ID to an Ubuntu image, and the instance type to `t2.micro`, which qualifies for AWS' free tier. It also sets a tag to give the instance a name.

[Source](https://learn.hashicorp.com/tutorials/terraform/aws-build)

---

## Commands

### `terraform init`
Initializes the backend and provider plugins

### `terraform fmt`
Formats the terraform configuration file for consistency and readability

### `terraform validate`
Validates the configuration file

### `terraform apply`
Prints out the execution plan and then deploys it if the user approves it

### Dynamically pass variables to terraform
```
terraform apply -var "instance_name=JoshsInstance"
```

### `terraform show`
Inspects the current state of the terraform resources

### `terraform destroy`
Tears down the managed infrastructure. This cannot be undone.

---

## Terraform Linting

[`tflint`](https://github.com/terraform-linters/tflint)

---

## Terraform Security Scanner

[`tfsec`](https://github.com/aquasecurity/tfsec)

---

## Tutorials
HashiCorp's tutorial can be found [here](https://developer.hashicorp.com/terraform/tutorials/)

### AWS Tutorial
HashiCorp's AWS tutorial can be found [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started)

### Using variables in variables
[This StackOverflow answer](https://stackoverflow.com/a/58841360) covers how to use variables in variables.

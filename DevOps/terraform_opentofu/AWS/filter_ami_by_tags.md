# Filter AMI by tags
For some reason I couldn't find this in [the official documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#tags) but thankfully I found [someone on StackOverflow](https://stackoverflow.com/a/60869513) who had the same problem.

This will allow you to filter an AMI by its tags:
```
variable "filter_tags" { # the tags to filter the latest AMI by
  type = map(string)
  default = {
    "gitlab_pipeline_id" = "6858"
  }
}

data "aws_ami" "latest_pipeline_ami" {
  most_recent = true
  owners      = ["self"]

  dynamic "filter" {
    for_each = var.filter_tags
    iterator = tag

    content {
      name   = "tag:${tag.key}"
      values = ["${tag.value}"]
    }
  }
}
```

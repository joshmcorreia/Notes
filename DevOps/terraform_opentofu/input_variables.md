# terraform Input Variables

## `variables.tf` file
[Docs](https://developer.hashicorp.com/terraform/language/values/variables)

Variables are stored in a `variables.tf` file.
Example:
``` terraform
variable "container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "ExampleNginxContainer"
}
```

Now from `main.tf` you can reference the variable like so:
``` terraform
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name # <---------------------
  ports {
    internal = 80
    external = 8080
  }
}
```

## Passing variables in from the command line
[Docs](https://developer.hashicorp.com/terraform/language/values/variables#string)

You can also pass variables in from the command line. These will take precedence over the `variables.tf` file.

```
$ terraform apply -var "container_name=YetAnotherName"
```
OR
```
$ terraform apply -var="container_name=YetAnotherName"
```

## String variables
[Docs](https://developer.hashicorp.com/terraform/language/values/variables#string)

Example:
```
variable "container_name" {
  type = string
}
```
Note that this block does not have a default value. If a default value is not provided, you will be prompted to input one via the command line. If one is not provided (you just press enter) then the value will be stored as `null`.
```
$ terraform apply
var.container_name
  Enter a value:

...

 - name = "YetAnotherName" -> null # forces replacement
```

## Validation rules
[Docs](https://developer.hashicorp.com/terraform/language/values/variables#custom-validation-rules)

Example:
```
variable "container_name" {
  description = "Value of the name for the Docker container"
  type = string
  default = "ExampleNginxContainer"

  validation {
    condition = length(var.container_name) > 4
    error_message = "The container_name must be more than 4 characters long."
  }
}
```
Example of trying to provide a value that does not pass validation:
```
$ terraform apply -var="container_name=J"
docker_image.nginx: Refreshing state... [id=sha256:021283c8eb95be02b23db0de7f609d603553c6714785e7a673c6594a624ffbdanginx]

Planning failed. Terraform encountered an error while generating this plan.

╷
│ Error: Invalid value for variable
│
│   on variables.tf line 1:
│    1: variable "container_name" {
│     ├────────────────
│     │ var.container_name is "J"
│
│ The container_name must be more than 4 characters long.
│
│ This was checked by the validation rule at variables.tf:6,3-13.
╵
```

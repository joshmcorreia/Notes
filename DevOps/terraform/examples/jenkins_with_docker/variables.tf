variable "container_name" {
  description = "Value of the name for the Docker container"
  type = string
  default = "ExampleJenkinsContainer"

  validation {
    condition = length(var.container_name) > 4
    error_message = "The container_name must be more than 4 characters long."
  }
}

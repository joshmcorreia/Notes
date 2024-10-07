# Output Values
[Docs](https://developer.hashicorp.com/terraform/language/values/outputs)

## Output docker container information
Example `outputs.tf`:
```
output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}
```
```
$ terraform output
container_id = "a8e5e961da648acd244a18616813b97cff11c3beb5999373de240f136f47c2c8"
```
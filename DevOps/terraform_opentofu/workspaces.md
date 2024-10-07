# Terraform Workspaces

[Documentation](https://developer.hashicorp.com/terraform/language/state/workspaces)

## List all workspaces
[Source](https://developer.hashicorp.com/terraform/cli/commands/workspace/list)
```
$ terraform workspace list
  default
* example
```

## Print out your current workspace
[Source](https://developer.hashicorp.com/terraform/cli/commands/workspace/show)
```
$ terraform workspace show
example
```

## Select a workspace
[Source](https://developer.hashicorp.com/terraform/cli/commands/workspace/select)
```
terraform workspace select example
```

## Create a workspace
[Source](https://developer.hashicorp.com/terraform/cli/commands/workspace/new)
```
terraform workspace new example
```

## Delete a workspace
[Source](https://developer.hashicorp.com/terraform/cli/commands/workspace/delete)
```
terraform workspace delete example
```

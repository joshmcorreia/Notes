# jq

[Source code](https://github.com/stedolan/jq)

## Sample file
[Source](https://tecadmin.net/linux-jq-command/)

This is the sample file that I'll be using for demonstration purposes, named `employee.json`
```
{"workers":{"name": "John Brooks","id": "003"}}
```

## Pretty print a json file
[Source](https://tecadmin.net/linux-jq-command/)
```
$ jq '.' employee.json
{
  "workers": {
    "name": "John Brooks",
    "id": "003"
  }
}
```

## Print the value of a specific key
[Source](https://tecadmin.net/linux-jq-command/)
```
$ jq '.workers' employee.json
{
  "name": "John Brooks",
  "id": "003"
}
```

## Print the values of nested keys
[Source](https://tecadmin.net/linux-jq-command/)
```
$ jq '.workers.name' employee.json
"John Brooks"
```

## Save jq changes to a file
[Source](https://stackoverflow.com/questions/42716734/modify-a-key-value-in-a-json-using-jq-in-place)
```
$ echo "$( jq '.workers.name = "abcde"' employee.json )" > employee.json
```

## Update a key's value
```
$ echo "$( jq '.workers.name = "abcde"' employee.json )" > employee.json
```

## Delete a key
```
$ echo "$( jq 'del(.workers.id)' employee.json)" > employee.json
```

# jq

[Source code](https://github.com/stedolan/jq)

## Sample file
[Source](https://tecadmin.net/linux-jq-command/)

This is the sample file that I'll be using for demonstration purposes, named `employee.json`
```
{"workers":{"name": "John Brooks","id": "003","jobs": []}}
```

---

## Pretty print a json file
[Source](https://tecadmin.net/linux-jq-command/)
```
$ jq '.' employee.json
{
  "workers": {
    "name": "John Brooks",
    "id": "003",
    "jobs": []
  }
}
```

---

## Print the value of a specific key
[Source](https://tecadmin.net/linux-jq-command/)
```
$ jq '.workers' employee.json
{
  "name": "John Brooks",
  "id": "003",
  "jobs": []
}
```

---

## Print the value of a specific key if the key is a number
Sample `databases.json`
```
{"1": "names","2": "addresses"}
```
[Getting data from json using jq when key is numerical string](https://stackoverflow.com/a/28847101)
```
$ jq '.1' databases.json
0.1 # this is not the behavior we want

$ jq '.["1"]' databases.json
"names"
```

---

## Print the values of nested keys
[Source](https://tecadmin.net/linux-jq-command/)
```
$ jq '.workers.name' employee.json
"John Brooks"
```
OR
```
$ jq '.workers["name"]' employee.json
"John Brooks"
```
This is especially useful when a key contains a dash `-` such as `.workers["first-name"]` and can help avoid the error message "... cannot be subtracted".

---

## Print the value of a key without quotes
```
$ jq -r '.workers.name' employee.json
John Brooks
```

---

## Save jq changes to a file
[Source](https://stackoverflow.com/questions/42716734/modify-a-key-value-in-a-json-using-jq-in-place)
```
$ echo "$( jq '.workers.name = "abcde"' employee.json )" > employee.json
$ cat employee.json
{
  "workers": {
    "name": "abcde",
    "id": "003",
    "jobs": []
  }
}
```

---

## Update a key's value
```
$ echo "$( jq '.workers.name = "abcde"' employee.json )" > employee.json
$ cat employee.json
{
  "workers": {
    "name": "abcde",
    "id": "003",
    "jobs": []
  }
}
```

---

## Add to a list
```
$ jq '.workers.jobs |= . + ["software engineer"]' employee.json
{
  "workers": {
    "name": "John Brooks",
    "id": "003",
    "jobs": [
      "software engineer"
    ]
  }
}
```

---

## Delete a key
```
$ echo "$( jq 'del(.workers.id)' employee.json)" > employee.json
$ cat employee.json
{
  "workers": {
    "name": "John Brooks",
    "jobs": []
  }
}
```

---

## Loop over an array of objects
[How to iterate over JSON array with jq?](https://stackoverflow.com/a/68121251)

`repositories.json`:
```
[
  {
    "repositoryName": "repo_a",
    "repositoryId": "XXXXXX"
  },
  {
    "repositoryName": "repo_b",
    "repositoryId": "XXXXXX"
  },
  {
    "repositoryName": "repo_c",
    "repositoryId": "XXXXXX"
  },
  {
    "repositoryName": "repo_d",
    "repositoryId": "XXXXXX"
  }
]
```

```
$ cat repositories.json | jq '.[].repositoryName'
"repo_a"
"repo_b"
"repo_c"
"repo_d"
$ cat repositories.json | jq -r '.[].repositoryName'
repo_a
repo_b
repo_c
repo_d
```

---

## Loop over an array of objects when a key only sometimes exists

[How to check for presence of 'key' in jq before iterating over the values](https://stackoverflow.com/a/42099242)

`repositories.json`:
```
[
  {
    "repositoryName": "repo_a",
    "repositoryId": "XXXXXX",
    "repositoryAuthor": "bob"
  },
  {
    "repositoryName": "repo_b",
    "repositoryId": "XXXXXX",
    "repositoryAuthor": "sally"
  },
  {
    "repositoryName": "repo_c",
    "repositoryId": "XXXXXX"
  },
  {
    "repositoryName": "repo_d",
    "repositoryId": "XXXXXX"
  }
]
```

```
$ cat repositories.json | jq -r '.[] | select (.repositoryAuthor != null) | .repositoryAuthor'
bob
sally
```

---

## Check if a key value pair exists in an array of objects
[How to check for presence of 'key' in jq before iterating over the values](https://stackoverflow.com/a/42099242)

`repositories.json`:
```
[
  {
    "repositoryName": "repo_a",
    "repositoryId": "XXXXXX"
  },
  {
    "repositoryName": "repo_b",
    "repositoryId": "XXXXXX"
  },
  {
    "repositoryName": "repo_c",
    "repositoryId": "XXXXXX"
  },
  {
    "repositoryName": "repo_d",
    "repositoryId": "XXXXXX"
  }
]
```

```
$ cat repositories.json  | jq -e '.[] | select(.repositoryName == "repo_a")'
{
  "repositoryName": "repo_a",
  "repositoryId": "XXXXXX"
}
$ echo $?
0

$ cat repositories.json  | jq -e '.[] | select(.repositoryName == "repo_z")'
$ echo $?
4
```

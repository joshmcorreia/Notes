# Jenkins Parameters
[Jenkins Parameters](https://www.jenkins.io/doc/book/pipeline/syntax/#parameters)

### Boolean parameters
Example:
```
parameters {
    booleanParam(name: 'DEBUG_BUILD', defaultValue: true, description: '')
}
```

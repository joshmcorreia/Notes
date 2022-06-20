# GitLab CI/CD

## Stageless Pipelines
The `needs` keyword can be used to specify the dependencies of jobs which makes the pipelines run faster than they would while using stages. Stageless pipelines end up looking for complex, but are actually more efficient. [Source](https://docs.gitlab.com/ee/ci/yaml/#needs)

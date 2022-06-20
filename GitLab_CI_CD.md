# GitLab CI/CD

## Directed Acyclic Graph (DAG)
Instead of using the traditional stages, you can use a [Directed Acyclic Graph](https://docs.gitlab.com/ee/ci/directed_acyclic_graph/) for setting up pipelines. The [`needs`](https://docs.gitlab.com/ee/ci/yaml/#needs) keyword can be used to specify the dependencies of jobs which makes the pipelines run faster than they would while using stages. Stageless pipelines end up looking more complex, but are actually more efficient.

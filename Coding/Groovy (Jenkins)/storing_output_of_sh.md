# Storing output of `sh` commands
```groovy
def output = sh(script: 'date', returnStdout: true).trim()
```

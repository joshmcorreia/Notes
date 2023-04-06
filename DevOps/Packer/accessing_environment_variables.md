# Using environment variables with Packer:
The following example allows you to access environment variables via Packer
```
variables {
  user = env("USER")
}
```

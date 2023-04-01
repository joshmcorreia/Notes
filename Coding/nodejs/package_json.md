# package.json

## Documentation:
- [Official npm Documentation](https://docs.npmjs.com/cli/v9/configuring-npm/package-json)


## What it is:
The `package.json` file stores information about the Node Project.

## How to create it:
```
npm init
```
Here's an example from the [npm documentation](https://docs.npmjs.com/creating-a-package-json-file):
```
{
  "name": "my_package",
  "description": "",
  "version": "1.0.0",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/monatheoctocat/my_package.git"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/monatheoctocat/my_package/issues"
  },
  "homepage": "https://github.com/monatheoctocat/my_package"
}
```

## Dependencies:
[npm dependencies Documentation](https://docs.npmjs.com/cli/v9/configuring-npm/package-json#dependencies)


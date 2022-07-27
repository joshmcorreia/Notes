# Semantic Versioning:
When versioning software, I like to follow [semantic versioning](https://github.com/semver/semver/blob/master/semver.md).

## Semantic versioning summary:
Given a version number MAJOR.MINOR.PATCH, increment the:
1. MAJOR version when you make incompatible API changes
2. MINOR version when you add functionality in a backwards compatible manner
3. PATCH version when you make backwards compatible bug fixes

## Rule highlights:
These are the rules that I find particularly important to follow and reference:
1. For a version number X.Y.Z, X/Y/Z must be non-negative integers and should not contain leading zeroes. This means that the version `0.0.1` is valid, while the version `0.0.01` is not.
2. Once a versioned package has been released, the contents of that version MUST NOT be modified.
3. Prefixing a version number with "v" is not semantic versioning.

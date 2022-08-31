# Semantic Versioning:
When versioning software, I like to follow [semantic versioning](https://github.com/semver/semver/blob/master/semver.md).

[Here](https://jubianchi.github.io/semver-check/#/) is a fancy online semantic versioning checker that someone wrote to help visualize what incrementing a semantic version looks like.

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

---

# Combining Semantic Versioning with Git Tagging:
There is a [great video](https://www.youtube.com/watch?v=4wPjo5C-v8Y) which covers this, but some overall points to be aware of are as follows:
1. Name annotated tags with semantic version numbers. For example, if you are releasing version 1.4.6, you would create a Git tag annotated `v1.4.6` and the message would be `Release 1.4.6`
  ```
  git tag -a v1.4.6 -m "Release 1.4.6"
  ```

---

# Using Semantic Versioning with build numbers
I found [this StackExchange post](https://softwareengineering.stackexchange.com/questions/426632/how-to-deal-with-semver-in-a-build-number-based-company) to be useful.

Semantic versioning v2 rules state that build metadata can be included by appending a plus sign to the patch version, followed by additional build information. It is important to note that build metadata is ignored when determining precedence, so the builds `1.2.3+0001` and `1.2.3+9999` have the same precedence.

Example:
```
# version 1.2.3, build number 6789
1.2.3+6789
```

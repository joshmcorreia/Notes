# Versioning

## Alpha Releases
[Source](https://stackoverflow.com/questions/40067469/what-is-the-difference-between-alpha-and-beta-release)
> This is the release when the feature which you are developing is incomplete or partially complete.

## Beta Releases
[Source](https://stackoverflow.com/questions/40067469/what-is-the-difference-between-alpha-and-beta-release)
> This release is done when the product feature is complete and all the development is done but there are possibilities that it could contain some bugs and performance issues.

## Releasing to Customers
To make releases simple, I believe that you should not release version `1.0.0` of software until it is either being sent to a customer or released publicly. This means that internal versions should start with version 0, `0.12.4` for example.

If software that is still in development and has not been released to a customer starts with version `1.X.X` then you can end up with scenarios where the first product released is version `1.37.2`. This is odd when releasing to the first customer, and also means that your changelog (if done correctly) will have at least 37 different changes in it before even being released to a customer.

## Versioning Before Releasing to Customers
In my opinion, it doesn't make sense to use semantic versioning until code will be released to customers. When developing internally there are so many rapid changes early on in development that it seems meaningless to bump major/minor/patch versions.

Instead of internally using semantic versioning, I think it makes more sense to use build numbers. With build numbers you're still able to track what changes are the latest without the hassle of having to track whether the code contribution is a major/minor/patch version. If a build is sent to QA for testing it's easy to understand that build 1001 came after build 1000.

Example:
1. Alice makes a new feature branch off of `dev` and commits some code. CI/CD will automatically build this code, and creates build `1001`
2. A few hours later Bob makes a new feature branch off of `dev` and also commits some code. CI/CD will automatically build this code, and creates build `1002`
3. Bob puts up a merge request, the merge request is accepted, and is merged back into `dev`. CI/CD will automatically build this code and creates build `1003`, then tags that commit as `build-1003`
4. Alice puts up a merge request, the merge request is accepted, and is merged back into `dev`. CI/CD will automatically build this code and creates build `1004`, then tags that commit as `build-1004`

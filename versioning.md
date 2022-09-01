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

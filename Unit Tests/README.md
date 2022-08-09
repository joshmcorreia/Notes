# Unit Tests

## Resources:
- https://docs.microsoft.com/en-us/dotnet/core/testing/unit-testing-best-practices

## Mocks vs Stubs vs Fakes:
[Here](https://dotnetcoretutorials.com/2021/06/19/mocks-vs-stubs-vs-fakes-in-unit-testing/) is a great article that clearly shows the differences between these three, including examples.
- Fakes are used only to satisfy the requirements of the constructor and not asserted against
- You assert against a mock object
- You do not assert against a stub

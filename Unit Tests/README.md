# Unit Tests

## Resources:
- https://docs.microsoft.com/en-us/dotnet/core/testing/unit-testing-best-practices

---

## Mocks vs Stubs vs Fakes:
[Here](https://dotnetcoretutorials.com/2021/06/19/mocks-vs-stubs-vs-fakes-in-unit-testing/) is a great article that clearly shows the differences between these three, including examples.
- You assert against a mock object
- You do not assert against a stub and stubs are used only to satisfy the requirements of the constructor and not asserted against

---

## Arrange, Act, Assert
- **Arrange** your objects, creating and setting them up as necessary.
- **Act** on an object.
- **Assert** that something is as expected.

Make sure each one of these is on a separate line for readability, don't try to put them all on one line to shorten how many lines of code there are.

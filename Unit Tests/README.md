# Unit Tests

## Resources
- https://docs.microsoft.com/en-us/dotnet/core/testing/unit-testing-best-practices

---

## Mocks vs Stubs vs Fakes
[Here](https://dotnetcoretutorials.com/2021/06/19/mocks-vs-stubs-vs-fakes-in-unit-testing/) is a great article that clearly shows the differences between these three, including examples.
- You assert against a mock object
- You do not assert against a stub and stubs are used only to satisfy the requirements of the constructor and not asserted against

---

## Naming Tests
The name of your test should consist of three parts:
- The name of the method being tested.
- The scenario under which it's being tested.
- The expected behavior when the scenario is invoked.

Good example:
```
Add_SingleNumber_ReturnsSameNumber()
```

Bad example:
```
Test_Single()
```

---

## Arrange, Act, Assert
- **Arrange** your objects, creating and setting them up as necessary.
- **Act** on an object.
- **Assert** that something is as expected.

Make sure each one of these is on a separate line for readability, don't try to put them all on one line to shorten how many lines of code there are.

---

## Avoid Magic Strings
Always label strings/values when testing edge cases. It makes it much easier for reviewers and people working on the project in the future to understand why certain tests exist and what edge cases to be aware of.

Good Example:
```
MAXIMUM_RESULT = "1001"
calculator.add(MAXIMUM_RESULT)
```

Bad Example:
```
calculator.add("1001")
```

---

## Avoid Logic in Tests
Keep your tests simple. Logic should exist in the code being tested, not in the test code. Introducing logic into the test code can introduce bugs and indicate that you should instead be breaking up your test case into multiple different tests.

Avoid using logical conditions such as `if`, `while`, `for`, `switch`, etc.

---

## Avoid Multiple Acts
Avoid having multiple Acts in a single unit test. Having multiple Acts makes it more difficult to track down which Act caused the failure, and indicates that your unit test should be broken up into multiple tests.

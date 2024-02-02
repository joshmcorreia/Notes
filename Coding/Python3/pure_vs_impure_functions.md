# Pure Functions
[Pure Functions vs Impure Functions in Python](https://medium.com/@benjamin.BA/pure-functions-vs-impure-functions-in-python-b2f009664ee4)

Pure functions always return the same values given the same inputs, and nothing outside the function is able to influence what is returned.

Example:
``` python
def add_numbers(num1, num2):
    return num1 + num2
```

As you can see in the above example, this function is pure because it does not depend on values in a class or other external values.

# Impure Functions
[Pure Functions vs Impure Functions in Python](https://medium.com/@benjamin.BA/pure-functions-vs-impure-functions-in-python-b2f009664ee4)

Impure functions depend on values outside the function, such as accessing class values.

Example:
``` python
class Addition:
    def __init__(self):
        self.num1 = 1
        self.num2 = 2

    def add_numbers(self):
        return self.num1 + self.num2
```
Example execution:
```
>>> add = Addition()
>>> add.add_numbers()
3
```

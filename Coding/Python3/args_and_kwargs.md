## args and kwargs
You've probably seen `*args` and `**kwargs` in code before, but it isn't immediately clear what they do.

- `*args` stands for "arguments"
- `**kwargs` stands for "keyword arguments"

[This post](https://stackoverflow.com/a/1769475) contains more information.

## args
`*args` allow you to pass in an arbitrary number of positional arguments.
```
def test(*args):
    print(f"The arguments provided were `{args}`")

test("1", "2", "3")
> The arguments provided were `('1', '2', '3')`
```

## kwargs
`**kwargs` allow you to pass in arbitrary key value pairs, also known as named arguments.
```
def test(**kwargs):
    print(f"The keyword arguments provided were `{kwargs}`")

test(name="josh")
> The keyword arguments provided were `{'name': 'josh'}`
```

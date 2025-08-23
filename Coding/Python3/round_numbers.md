# Round Numbers in Python

## Using f-strings to round
```
>>> number = 56.87923
>>> print(f"{number:.0f}")
57
>>> print(f"{number:.1f}")
56.9
>>> print(f"{number:.2f}")
56.88
>>> print(f"{number:.3f}")
56.879
>>> print(f"{number:.4f}")
56.8792
```

## Using f-strings to pad zeros
```
>>> number = 1
>>> print(f"{number:0.2f}")
1.00
```

## Using `round()`
Examples:
```
>>> number = 56.87923
>>> round(number,-2)
100.0
>>> round(number,-1)
60.0
>>> round(number,0)
57.0
>>> round(number,1)
56.9
>>> round(number,2)
56.88
>>> round(number,3)
56.879
>>> round(number,4)
56.8792
>>> round(number,5)
56.87923
>>> round(number,6)
56.87923
```

## Using `format()` to pad zeros
Example #1:
```
>>> number = 1.0
>>> "{:0.2f}".format(number)
'1.00'
>>> "{:0.5f}".format(number)
'1.00000'
```

Example #2:
```
>>> number = 1.0
>>> format(number, "0.2f")
'1.00'
>>> format(number, "0.5f")
'1.00000'
```

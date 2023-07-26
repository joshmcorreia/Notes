# Round Numbers in Python

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
Example:
```
>>> number = 1.0
>>> format(number, "0.2f")
'1.00'
>>> format(number, "0.5f")
'1.00000'
```

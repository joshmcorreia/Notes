## Python3 Strings

## Split string every nth character
[Source](https://stackoverflow.com/a/9475354)
```
>>> line = '1234567890'
>>> n = 2
>>> [line[i:i+n] for i in range(0, len(line), n)]
['12', '34', '56', '78', '90']
```

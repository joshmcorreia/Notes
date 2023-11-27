# Strings

``` js
var my_name = "Josh"

// remove x characters from the end of a string:
my_name = my_name.slice(0, -2);

// uppercase the string
my_name = my_name.toUpperCase()

// lowercase the string
my_name = my_name.toLowerCase()

// split strings based on a delimiter
var input_string = "1,2,3"
var items = input_string.split(",")

// check if a string contains another string
if my_name.includes("Jo") {
}

// remove leading and trailing whitespace
my_name = my_name.trim()

// remove leading whitespace
my_name = my_name.trimStart()

// remove trailing whitespace
my_name = my_name.trimEnd()
```

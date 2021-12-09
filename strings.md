# Strings:

### Python3:
``` python
my_name = "Josh"

# remove x characters from the end of a string:
my_name = my_name[:-2]

# uppercase the string
my_name = my_name.upper()

# lowercase the string
my_name = my_name.lower()

# split strings based on a delimiter
input_string = "1,2,3"
items = input_string.split(",")

# check if a string contains another string
if "Jo" in my_name:

# remove leading and trailing whitespace
my_name = my_name.strip()

# remove leading whitespace
my_name = my_name.lstrip()

# remove trailing whitespace
my_name = my_name.rstrip()
```

### JavaScript:
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

### C#:
``` csharp
string my_name = "Josh";

// remove x characters from the end of a string:
my_name = my_name.Substring(0, my_name.Length - 2);

// uppercase the string
my_name = my_name.ToUpper();

// lowercase the string
my_name = my_name.ToLower();

// split strings based on a delimiter
string input_string = "1,2,3";
string[] items = input_string.Split(",");

// check if a string contains another string
if (my_name.Contains("Jo")) {
}

// remove leading and trailing whitespace
my_name = my_name.Trim();

// remove leading whitespace
my_name = my_name.TrimStart();

// remove trailing whitespace
my_name = my_name.TrimEnd();
```

### bash:
``` bash
my_name="Josh"

# remove x characters from the end of a string:
my_name=${my_name::-2}

# uppercase the string
my_name=${my_name^^}

# lowercase the string
my_name=${my_name,,}

# check if a string contains another string
if [[ $my_name == *"Jo"* ]]; then
    echo "Name contains 'Jo'"
fi
```

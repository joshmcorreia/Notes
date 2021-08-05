# How to Code:
This is a comprehensive list of a bunch of common functions that I use. Each section contains how to do it in all of the langauges that I write in so that I can easily switch between languages.

***

# How to print to the console:

### Python3:
``` python3
print(message)
```

### JavaScript:
``` js
console.log(message)
```

### C#:
``` c#
Console.WriteLine(message);
```

***

# String interpolation:

### Python3:
Note that these are specifically called "f-strings".
``` python3
my_name = "Josh"
message = f"My name is {my_name}."
```

### JavaScript:
``` js
var my_name = "Josh"
var message = `My name is ${my_name}.`
```

### C#:
``` c#
string my_name = "Josh";
string message = $"My name is {my_name}.";
```

***

# Remove x characters from the end of a string:

### Python3:
``` python3
my_name = "Josh"
my_name = my_name[:-2]
```

### JavaScript:
``` js
var my_name = "Josh"
my_name = my_name.slice(0, -2);
```

### C#:
``` c#
string my_name = "Josh";
my_name = my_name.Substring(0, my_name.Length - 2);
```

***

# Lists:

### Python3:

``` python3
# create a list
my_list = []

# add to the list
my_list.append("Josh")

# remove from the list
my_list.remove("Josh")

# loop over the list
for item in my_list:
    print(item)
```

### JavaScript:
``` js
// create a list
var my_list = []

// add to the list
my_list.push("Josh")

// remove from the list
my_list.pop("Josh")

// loop over the list
for (const item of items){
    console.log(item);
}
```

### C#:
``` c#
// create a list
List<string> my_list = new List<string>();

// add to the list
my_list.Add("Josh");

// remove from the list
my_list.Remove("Josh");

// loop over the list
foreach (var item in items) {
    Console.WriteLine(item);
}
```

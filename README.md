# How to Code:
This is a comprehensive list of a bunch of common functions that I use. Each section contains how to do it in all of the langauges that I write in so that I can easily switch between languages.

***

# How to print to the console:

### Python3:
```
print(message)
```

### JavaScript:
```
console.log(message)
```

### C#:
```
Console.WriteLine(message);
```

***

# String interpolation:

### Python3:
Note that these are specifically called "f-strings".
```
my_name = "Josh"
message = f"My name is {my_name}."
```

### JavaScript:
```
var my_name = "Josh"
var message = `My name is ${my_name}.`
```

### C#:
```
string my_name = "Josh";
string message = $"My name is {my_name}.";
```

***

# Remove x characters from the end of a string:

### Python3:
```
my_name = "Josh"
my_name = my_name[:-2]
```

### JavaScript:
```
var my_name = "Josh"
my_name = my_name.slice(0, -2);
```

### C#:
```
string my_name = "Josh";
my_name = my_name.Substring(0, my_name.Length - 2);
```

***

# How to create a list:

### Python3:
```
my_list = []
```

### JavaScript:
```
var my_list = []
```

### C#:
```
List<string> my_list = new List<string>();
```

***

# How to add to a list:

### Python3:
```
my_list = []
my_list.append("Josh")
```

### JavaScript:
```
var my_list = []
my_list.push("Josh")
```

### C#:
```
List<string> my_list = new List<string>();
my_list.Add("Josh");
```

***

# How to loop over a list:

### Python3:
```
for item in items:
    print(item)
```

### JavaScript:
```
for (const item of items){
    console.log(item);
}
```

### C#:
```
foreach (var item in items) {
    Console.WriteLine(item);
}
```

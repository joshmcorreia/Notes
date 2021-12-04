# How to Code:
This is a comprehensive list of a bunch of common functions that I use. Each section contains how to do it in all of the languages that I write in so that I can easily switch between languages.

***

# How to print to the console:

### Python3:
``` python3
message = "Hello"
print(message)
```

### JavaScript:
``` js
var message = "Hello"
console.log(message)
```

### C#:
``` c#
string message = "Hello";
Console.WriteLine(message);
```

### bash:
``` bash
message="ok"
echo $message
```

***

# How to run shell commands:

### Python3:
``` python3
from subprocess import Popen, PIPE

shell_command = "pip3 list"
capture = Popen(shell_command, stdout=PIPE, shell=True)
std_out, std_err = capture.communicate()
return_code = capture.returncode
```

### JavaScript:
Not possible

### C# ([Source](https://stackoverflow.com/questions/1469764/run-command-prompt-commands)):
Note: This runs Command Prompt since C# runs on Windows systems. It's better to call libraries when possible.
``` c#
System.Diagnostics.Process process = new System.Diagnostics.Process();
System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
startInfo.FileName = "cmd.exe";
startInfo.Arguments = "/C copy /b Image1.jpg + Archive.rar Image2.jpg";
process.StartInfo = startInfo;
process.Start();
```

### bash:
Everything is a shell command

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

### bash:
``` bash
my_name="Josh"
echo "My name is $my_name"
```

***

# Strings:

### Python3:
``` python3
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
``` c#
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

***

# Sets:
Note: sets are unordered lists with no duplicate elements

### Python3:

``` python3
# create an empty set
my_set = set()

# create a pre-populated set
my_set = set(("josh", "john"))
OR
my_set = {"josh", "john"}

# print out the contents of a set
print(my_set)

# check if something exists within a set
if "steven" in my_set:
    print("steven exists within the set")

# add to the set
my_set.add("steven")

# remove from the set
# Note: raises an error if the item does not exist
my_set.remove("steven")

# discard from the set
# Note: does not raise an error if the item does not exist
my_set.discard("steven")

# empty the set
my_set.clear()

# loop over the set
for item in my_set:
    print(item)

# add the contents of one set to another
set1 = {"josh"}
set2 = {"john"}
set1.update(set2) # set1 will now have the contents of both sets

# combine two sets into a new set
set1 = {"josh"}
set2 = {"john"}
set3 = set1.union(set2)
```

### JavaScript:
``` js
// create an empty set
var my_set = new Set()

// create a pre-populated set
var my_set = new Set(["josh", "john"])

// print out the contents of a set
TODO

// check if something exists within a set
if (my_set.has("steven")) {
    console.log("steven exists within the set")
}

// add to the set
my_set.add("steven")

// remove from the set
my_set.delete("steven")

// empty the set
my_set.clear()

// loop over the set
my_set.forEach(x => console.log(x))

// add the contents of one set to another
var set1 = new Set(["josh"])
var set2 = new Set(["steven"])
set1 = new Set([...set1, ...set2])

// combine two sets into a new set
var set1 = new Set(["josh"])
var set2 = new Set(["steven"])
var set3 = new Set([...set1, ...set2])
```

### C#:
``` c#

```

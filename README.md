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

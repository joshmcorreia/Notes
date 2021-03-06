# Lists:

### Python3:

``` python
# create an empty list
my_list = []

# create a pre-populated list
my_list = ["josh", "steven"]

# print out the contents of a list
print(my_list)

# check if something exists within a list
if "josh" in my_list:

# add to the list
my_list.append("Josh")

# remove from the list
my_list.remove("Josh")

# empty the list
my_list.clear()

# loop over the list
for item in my_list:
    print(item)

# add the contents of one list to another
list1 = ["josh"]
list2 = ["steven"]
list1 = list1 + list2

# combine two lists into a new list
list1 = ["josh"]
list2 = ["steven"]
list3 = list1 + list2

# get the intersection of two lists
# Note: this returns which objects from list1 exist in list2
list1 = ["josh"]
list2 = ["josh", "steven"]
list_intersection = list(set(list1) & set(list2)) # O(n), but removes duplicates. https://stackoverflow.com/a/3697438
list_intersection = [x for x in list1 if x in list2] # O(n^2), but retains duplicates. https://stackoverflow.com/a/33067553

# get the difference between two lists
# Note: this returns which objects from list1 do not exist in list2
TODO
```

### JavaScript:
Note: lists are also known as Arrays in JavaScript
``` js
// create an empty list
var my_list = []

// create a pre-populated list
var my_list = ["josh", "steven"]

// print out the contents of a list
console.log(my_list)

// check if something exists within a list
if (my_list.includes("josh")) {
}

// add to the list
my_list.push("Josh")

// remove from the list
my_list.pop("Josh")

// empty the list
my_list.clear()

// loop over the list
for (const item of items){
    console.log(item);
}

// add the contents of one list to another
TODO

// combine two lists into a new list
TODO

// get the intersection of two lists
// Note: this returns which objects from list1 exist in list2
TODO

// get the difference between two lists
// Note: this returns which objects from list1 do not exist in list2
TODO
```

### C#:
``` csharp
// create an empty list
List<string> my_list = new List<string>();

// create a pre-populated list
List<string> my_list = new List<string> { "josh", "steven" };

// print out the contents of a list
Console.WriteLine(String.Join(", ", my_list));

// check if something exists within a list
if (my_list.Contains("josh")) {
}

// add to the list
my_list.Add("Josh");

// remove from the list
my_list.Remove("Josh");

// empty the list
my_list.Clear();

// loop over the list
foreach (var item in items) {
    Console.WriteLine(item);
}

// add the contents of one list to another
TODO

// combine two lists into a new list
TODO

// get the intersection of two lists
// Note: this returns which objects from list1 exist in list2
TODO

// get the difference between two lists
// Note: this returns which objects from list1 do not exist in list2
TODO
```

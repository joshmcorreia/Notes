# Lists:

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

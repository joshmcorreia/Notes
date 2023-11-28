# Sets:
Note: sets are unordered with no duplicate elements

### Python3:

``` python
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

# combine two sets into a new set, also known as a union
set1 = {"josh"}
set2 = {"john"}
set3 = set1.union(set2)

# get the intersection of two sets
# Note: this returns which objects from set1 exist in set2
set1 = {"josh"}
set2 = {"josh", "steven"}
set_intersection = set1.intersection(set2) # this will return `set("josh")`

# get the difference between two sets
# Note: this returns which objects from set1 do not exist in set2
set1 = {"josh"}
set2 = {"steven"}
set_difference = set1.difference(set2) # this will return `set("josh")`
```

### C#:
``` csharp
// create an empty set
HashSet<string> my_set = new HashSet<string>();

// create a pre-populated set
HashSet<string> my_set = new HashSet<string>() {"josh", "john"};

// print out the contents of a set
TODO

// check if something exists within a set
if (my_set.Contains("steven")) {
}

// add to the set
my_set.Add("steven");

// remove from the set
my_set.Remove("steven");

// empty the set
my_set.Clear();

// loop over the set
foreach (string entry in my_set) {
    Console.WriteLine(entry);
}

// add the contents of one set to another
TODO

// combine two sets into a new set, also known as a union
TODO

// get the intersection of two sets
// Note: this returns which objects from set1 exist in set2
TODO

// get the difference between two sets
// Note: this returns which objects from set1 do not exist in set2
TODO
```

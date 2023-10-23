# Lists
``` python
# create an empty list
my_list = []

# create a pre-populated list
my_list = ["josh", "bob"]

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
list2 = ["bob"]
list1 = list1 + list2

# combine two lists into a new list
list1 = ["josh"]
list2 = ["bob"]
list3 = list1 + list2

# get the intersection of two lists
# Note: this returns which objects from list1 exist in list2
list1 = ["josh"]
list2 = ["josh", "bob"]
list_intersection = list(set(list1) & set(list2)) # O(n), but removes duplicates. https://stackoverflow.com/a/3697438
list_intersection = [x for x in list1 if x in list2] # O(n^2), but retains duplicates. https://stackoverflow.com/a/33067553
```

## Subtract one list from another
[How do I subtract one list from another?](https://stackoverflow.com/a/3428637)
```
>>> x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
>>> y = [1, 3, 5, 7, 9]
>>> z = [item for item in x if item not in y]
[0, 2, 4, 6, 8]
```

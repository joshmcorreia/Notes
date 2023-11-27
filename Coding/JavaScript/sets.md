# Sets

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

// combine two sets into a new set, also known as a union
var set1 = new Set(["josh"])
var set2 = new Set(["steven"])
var set3 = new Set([...set1, ...set2])

// get the intersection of two sets
// Note: this returns which objects from set1 exist in set2
var set1 = new Set(["josh"])
var set2 = new Set(["josh", "steven"])
var set_intersection = new Set([...set1].filter(x => set2.has(x))); // this will return `Set(["josh"])`

// get the difference between two sets
// Note: this returns which objects from set1 do not exist in set2
var set1 = new Set(["josh"])
var set2 = new Set(["steven"])
var set_difference = new Set([...set1].filter(x => !set2.has(x))); // this will return `Set(["josh"])`
```

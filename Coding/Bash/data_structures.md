# Bash Data Structures

## Declare an empty array
``` bash
animals=()
```

## Declare a pre-populated array
[Source](https://www.freecodecamp.org/news/bash-array-how-to-declare-an-array-of-strings-in-a-bash-script/)
``` bash
animals=("cat" "dog" "bird")
```

## Loop over an array
[Source](https://www.freecodecamp.org/news/bash-array-how-to-declare-an-array-of-strings-in-a-bash-script/)
``` bash
for str in ${animals[@]}; do
    echo $str
done
```

## Loop over an array with indices
[Source](https://www.freecodecamp.org/news/bash-array-how-to-declare-an-array-of-strings-in-a-bash-script/)
``` bash
for i in ${!animals[@]}; do
    echo "element $i is ${animals[$i]}"
done
```

## Add to an array
``` bash
animals+=("horse")
```

## Remove from an array
``` bash

```

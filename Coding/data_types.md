# Data Types:

---

# Boolean:
Stores true or false

#### Python3:
Size: 
Values: `True` or `False`
``` python
my_boolean = True
print(type(my_boolean)) # <class 'bool'>
```

#### JavaScript:
Size: 
Values: `true` or `false`
``` js
var my_boolean = true
```

#### C#:
Size: 1 byte
Values: `true` or `false`
``` csharp
bool my_boolean = true;
```

---

# Character:
Stores a single character/letter

#### Python3:
Doesn't exist in Python, see **String** below. The closest thing is a string with a length of one.

#### JavaScript:
Doesn't exist in JavaScript, see **String** below. The closest thing is a string with a length of one.

#### C#:
Size: 2 bytes
Values: Any single character/letter
``` csharp
char my_character = 'j';
```

---

# String:
Stores an ordered sequence of characters

#### Python3:
Size: internally uses different representations for Unicode strings, between 1 and 4 bytes per character
Values: 
``` python
my_string = "josh"
print(type(my_string)) # <class 'str'>
```

#### JavaScript:
Note: strings are immutable in JavaScript
Size: 2 bytes per character
Values: 
``` js
var my_string = "josh"
```

#### C#:
Size: 2 bytes per character
Values: 
``` csharp
string my_string = "josh";
```

---

# Integer:
Stores whole numbers

#### Python3:
Size: 4 bytes, but automatically expands as necessary
Values: infinite
``` python
my_integer = 5
print(type(my_integer)) # <class 'int'>
```

#### JavaScript:
Doesn't explicitly exist in JavaScript, see **Number**.

#### C#:
Size: 4 bytes
Values: `-2,147,483,648` to `2,147,483,647`
``` csharp
int my_integer = 4;
```

---

# Long:
Stores whole numbers

#### Python3:
Doesn't exist in Python, see **Integer** above.

#### JavaScript:
Doesn't explicitly exist in JavaScript, see **Number**.

#### C#:
Size: 8 bytes
Values: `-9,223,372,036,854,775,808` to `9,223,372,036,854,775,807`
``` csharp
long my_long = 1234567890123456789;
```

---

# Float:
Stores fractional numbers

#### Python3:
Size: 
Values:
``` python
my_float = 123.45
print(type(my_float)) # <class 'float'>
```

#### JavaScript:
Doesn't explicitly exist in JavaScript, see **Number**.

#### C#:
Size: 4 bytes
Values: 6 to 7 decimal digits
``` csharp
float my_float = 123.456;
```

---

# Double:
Stores fractional numbers

#### Python3:
Doesn't exist in Python, see **Float** above.

#### JavaScript:
Doesn't explicitly exist in JavaScript, see **Number**.

#### C#:
Size: 8 bytes
Values: 15 decimal digits
``` csharp
double my_double = 123.4567890;
```

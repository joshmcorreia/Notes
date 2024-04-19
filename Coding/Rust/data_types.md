# Data Types
[Data Types](https://doc.rust-lang.org/book/ch03-02-data-types.html#data-types)

---

# Scalar Types
- integers
- floating-point numbers
- booleans
- characters

## Integer Types
Length - Signed - Unsigned
8-bit - i8 - u8
16-bit - i16 - u16
32-bit - i32 - u32
64-bit - i64 - u64
128-bit - i128 - u128
arch - isize - usize

## Floating-Point Types
- f32
- f64

## Booleans
```rust
fn main() {
    let t = true;

    let f: bool = false;
}
```

## Character Type
```rust
fn main() {
    let c = 'z';
    let z: char = 'ℤ'; // with explicit type annotation
    let heart_eyed_cat = '😻';
}
```

---

# Compound Types
- tuples
- arrays

## Tuple:
```rust
fn main() {
    let tup: (i32, f64, u8) = (500, 6.4, 1);

    let (x, y, z) = tup;

    println!("The value of y is: {y}");
}
```

## Arrays:
```rust
fn main() {
    let a = [1, 2, 3, 4, 5];
    let b: [i32; 5] = [1, 2, 3, 4, 5];
    let c = [3; 5];
}
```

---

# Strings
[The String Type - The Rust Programming Language](https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html#the-string-type)

```rust
fn main() {
    let mut s = String::from("hello");

    s.push_str(", world!"); // push_str() appends a literal to a String

    println!("{}", s); // This will print `hello, world!`
}
```

---

# Vectors
[Vectors - The Rust Programming Language](https://doc.rust-lang.org/book/ch08-01-vectors.html)

## Create a new vector
```rust
fn main() {
    let v: Vec<i32> = Vec::new();
}
```

## Create a new vector with the vec macro
```rust
fn main() {
    let v = vec![1, 2, 3];
}
```

## Add values to a vector
```rust
fn main() {
    let mut v = Vec::new();

    v.push(5);
    v.push(6);
    v.push(7);
    v.push(8);
}
```

## Accessing elements in a vector
```rust
fn main() {
    let v = vec![1, 2, 3, 4, 5];

    let third: &i32 = &v[2];
    println!("The third element is {third}");

    let third: Option<&i32> = v.get(2);
    match third {
        Some(third) => println!("The third element is {third}"),
        None => println!("There is no third element."),
    }
}
```

## Looping over a vector
```rust
fn main() {
    let v = vec![100, 32, 57];
    for i in &v {
        println!("{i}");
    }
}
```
You can also loop over a vector and edit the elements
```rust
fn main() {
    let mut v = vec![100, 32, 57];
    for i in &mut v {
        *i += 50;
    }
}
```

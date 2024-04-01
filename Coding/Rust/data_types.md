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
```
fn main() {
    let t = true;

    let f: bool = false;
}
```

## Character Type
```
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
```
fn main() {
    let tup: (i32, f64, u8) = (500, 6.4, 1);

    let (x, y, z) = tup;

    println!("The value of y is: {y}");
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


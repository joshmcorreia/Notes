# Mutability

[Variables and Mutability](https://doc.rust-lang.org/book/ch03-01-variables-and-mutability.html)

- Variables are immutable by default

## Setting variables to be mutable
```rust
fn main() {
    let mut x = 5;
    println!("The value of x is: {x}");
    x = 6;
    println!("The value of x is: {x}");
}
```
Output:
```
The value of x is: 5
The value of x is: 6
```

# Shadowing

[Shadowing](https://doc.rust-lang.org/book/ch03-01-variables-and-mutability.html#shadowing)

- Shadowing is when you declare a new variable that has the same name as a previous variable.

## Shadowing a variable
```
fn main() {
    let x = 5;

    let x = x + 1;

    {
        let x = x * 2;
        println!("The value of x in the inner scope is: {x}");
    }

    println!("The value of x is: {x}");
}
```

Output:
```
$ cargo run
The value of x in the inner scope is: 12
The value of x is: 6
```

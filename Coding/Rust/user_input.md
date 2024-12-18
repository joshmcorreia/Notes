# Getting User Input

```rust
use std::io;

fn main() {
    let mut guess = String::new();
    println!("What is your guess?");
    io::stdin()
        .read_line(&mut guess)
        .expect("Failed to read line");
    println!("You guessed: {}", guess);
}
```

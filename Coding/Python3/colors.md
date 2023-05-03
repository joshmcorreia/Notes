# Printing with ANSI escape sequences
You can read more about ANSI Escape Sequences [here](https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797).

## Terminals with 8 and 16 colors:
```
COLOR_RED = '\x1B[31m'
COLOR_END = '\x1B[0m'

print(f"{COLOR_RED}This message prints in red{COLOR_END}")
```

You can print out all 8 foreground colors by copying/pasting the following into a Python shell:
```
COLOR_END = '\x1B[0m'
for x in range(30,38):
    COLOR = f'\x1B[{x}m'
    print(f"{COLOR}{x}{COLOR_END}")
```

You can print out all 8 background colors by copying/pasting the following into a Python shell:
```
COLOR_END = '\x1B[0m'
for x in range(40,48):
    COLOR = f'\x1B[{x}m'
    print(f"{COLOR}{x}{COLOR_END}")
```

## Terminals with 256 colors:
```
COLOR_ORANGE_FG = '\x1B[38;5;214m'
COLOR_END = '\x1B[38;5;0m'

print(f"{COLOR_ORANGE_FG}This message prints in orange{COLOR_END}")
```

You can print out all 256 foreground colors by copying/pasting the following into a Python shell:
```
COLOR_END = '\x1B[0m'
for x in range(0,255):
    COLOR_FG = f'\x1B[38;5;{x}m'
    print(f"{COLOR_FG}{x}{COLOR_END}")
```

You can print out all 256 background colors by copying/pasting the following into a Python shell:
```
COLOR_END = '\x1B[0m'
for x in range(0,255):
    COLOR_BG = f'\x1B[48;5;{x}m'
    print(f"{COLOR_BG}{x}{COLOR_END}")
```

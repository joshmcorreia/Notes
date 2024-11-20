# Accessing .env file variables

## Installing the python package
```
$ uv add python-dotenv
```

## Example
`main.py`:
```python
import os
from dotenv import load_dotenv

def main():
    load_dotenv()
    print(os.getenv("password"))

if __name__ == "__main__":
    main()
```

`.env`:
```
password="abc123"
```

Example execution:
```
$ uv run python3 main.py
abc123
```

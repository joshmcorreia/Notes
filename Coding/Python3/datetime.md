# Datetime

## Printing time duration (HH:MM:SS)
```python
>>> import datetime
>>> str(datetime.timedelta(seconds=10_000))
'2:46:40'
```

## Printing time duration (X hours X minutes X seconds)
[How do I convert seconds to hours, minutes and seconds?](https://stackoverflow.com/a/56958828)
```python
def pretty_print_seconds(seconds: int) -> str:
    hours = str(seconds // 3600)
    minutes = str((seconds % 3600) // 60)
    leftover_seconds = str((seconds % 3600) % 60)
    return f"{hours} hours {minutes} minutes {leftover_seconds} seconds"

print(pretty_print_seconds(10_000))
# 2 hours 46 minutes 40 seconds
```

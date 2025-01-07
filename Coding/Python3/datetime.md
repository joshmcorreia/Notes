# Datetime

## Printing time duration (HH:MM:SS)
```python
>>> import datetime
>>> str(datetime.timedelta(seconds=10_000))
'2:46:40'
```

## Printing time duration (X hours X minutes X seconds)
[How do I convert seconds to hours, minutes and seconds?](https://stackoverflow.com/a/56958828)

I edited the answer from the above link to be more robust:
```python
def pretty_print_seconds(seconds: int) -> str:
    seconds: int = int(seconds)
    hours: int = int(seconds // 3600)
    minutes: int = int((seconds % 3600) // 60)
    leftover_seconds: int = int((seconds % 3600) % 60)
    total_time_string: str = ""
    if hours == 1:
        total_time_string += f"{hours} hour "
    elif hours > 0:
        total_time_string += f"{hours} hours "
    if minutes == 1:
        total_time_string += f"{minutes} minute "
    elif minutes > 0:
        total_time_string += f"{minutes} minutes "
    if leftover_seconds == 1:
        total_time_string += f"{leftover_seconds} second"
    elif leftover_seconds > 0:
        total_time_string += f"{leftover_seconds} seconds"
    if total_time_string == "":
        return "less than 1 second"
    return total_time_string

print(pretty_print_seconds(10_000))
# 2 hours 46 minutes 40 seconds
print(pretty_print_seconds(3600))
# 1 hour
print(pretty_print_seconds(0))
# less than 1 second
```

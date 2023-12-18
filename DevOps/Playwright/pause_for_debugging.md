# Pause for Debugging

[wait_for_timeout](https://playwright.dev/python/docs/api/class-page#page-wait-for-timeout)

Waiting for the timeout allows you to interact with the page and inspect elements while in headed mode. This is great for debugging but should never be used in actual tests.
```python
time_in_seconds = 30
time_in_milliseconds = time_in_seconds * 1000
page.wait_for_timeout(time_in_milliseconds)
```

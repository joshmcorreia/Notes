# Exit on HTTP response status code 500
[Playwright: Stop if http status is 500](https://stackoverflow.com/a/66716555)
```python
from playwright.sync_api import Page

def handle_response(response):
    assert response.status != 500, "Status code 500: Internal Server Error"

def test_home_page(page: Page):
    page.on("response", handle_response) # any 500 from this point on will trigger the handler
    page.goto("https://www.google.com")
```

# Exit on HTTP response status code in range
```python
from playwright.sync_api import Page

def handle_response(response):
    assert 200 <= response.status < 400, f"Status code {response.status}"

def test_home_page(page: Page):
    page.on("response", handle_response) # any 500 from this point on will trigger the handler
    page.goto("https://www.google.com")
```

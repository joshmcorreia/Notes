# Playwright - New Pages Example
This is useful when you click links that have `target="_blank"`

[Handling new pages](https://playwright.dev/python/docs/pages#handling-new-pages)

```python
import re
from playwright.sync_api import Page, expect, BrowserContext

def test_legal_button_redirect(page: Page, context: BrowserContext):
    page.goto("https://test.com")
    with context.expect_page() as new_page_info:
        page.get_by_role("link", name="Legal").click()
    new_page = new_page_info.value
    new_page.wait_for_load_state() # comment out this line if you don't need to wait for content on the page to load, i.e. testing url
    expect(new_page).to_have_url("https://test.com/legal/")
```

---

## Close new pages/tabs
```python
import re
from playwright.sync_api import Page, expect, BrowserContext

def test_legal_button_redirect(page: Page, context: BrowserContext):
    page.goto("https://test.com")
    with context.expect_page() as new_page_info:
        page.get_by_role("link", name="Legal").click()
    new_page = new_page_info.value
    new_page.wait_for_load_state() # comment out this line if you don't need to wait for content on the page to load, i.e. testing url
    new_page.close()
```

# Playwright (Python) Example Tests

---

## Testing if a page has a specific title
[Playwright Title Test Example](https://playwright.dev/python/docs/intro)
```python
import re
from playwright.sync_api import Page, expect

def test_has_title(page: Page):
    page.goto("https://playwright.dev/")

    # Expect a title "to contain" a substring.
    expect(page).to_have_title(re.compile("Playwright"))
```

---

## Check that an element does not have an href
[Python Playwright - How can I check that an element does not have an href?](https://stackoverflow.com/a/77681589)
```python
import re
from playwright.sync_api import Page, expect

def test_reset_button(page: Page):
    page.goto("https://www.example.com")
    page.locator("#reset").click()
    expect(page.locator("#download")).not_to_have_attribute("href", value=re.compile(r".|"))
```

---

## Loop over links in a table
[Loop over elements in Playwright](https://jonathansoma.com/everything/scraping/loops-in-playwright/)
```python
links = page.locator("#advanced-table a")
count = links.count()

for i in range(count):
    link = links.nth(i)

    text = link.text_content()
    href = link.get_attribute("href")

    print(f"Link text is '{text}'")
    print(f"Link URL is '{href}'")
```

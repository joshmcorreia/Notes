# Puppeteer Examples
[Intro To Web Scraping With Puppeteer (YouTube)](https://www.youtube.com/watch?v=S67gyqnYHmI)

## Wait for a selector
``` js
var login_selector = "input[id='email']"
await page.waitForSelector(login_selector)
```

## Type into a field
``` js
var password_selector = "input[name='password']"
await page.type(password_selector, password)
```

## Press enter on the keyboard
``` js 
await page.keyboard.press("Enter");
await page.waitForNavigation();
```

## Click a button
``` js
var button_selector = "button[data-var='loginBtn']"
await page.click(button_selector);
```

## Navigate to a new page
``` js
var url = "https://www.google.com"
await page.goto(url);
```

## Close the browser
``` js
await browser.close()
```

## Get the page title
``` js
const title = await page.evaluate(() => document.title)
console.log(title)
```

## Get the raw HTML of a page
``` js
const html = await page.content()
console.log(html)
```

## Get all text on a page
``` js
const text = await page.evaluate(() => document.body.innerText)
console.log(text)
```

## Get a list of all links from the DOM
[Source](https://stackoverflow.com/a/49492141)
``` js
$ const hrefs = await page.$$eval('a', as => as.map(a => a.href));
$ console.log(hrefs)
[
  'https://discord.com/channels/@me',
  'https://discord.com/store',
  'https://support.discord.com/',
  'https://twitter.com/discord',
  'https://discordstatus.com/'
]
```
OR
``` js
const links = await page.evaluate(() => Array.from(document.querySelectorAll('a'), (elem) => elem.href))
console.log(links)
```

## Get a list of inputs on the page
```js
const inputs = await page.$$eval('input', (elements) =>
  elements.map((e) => ({
    id: e.id,
    name: e.name,
    class: e.class,
    type: e.type,
    placeholder: e.placeholder,
    value: e.value
  }))
)
console.log(inputs)
```
Sample output:
``` js
[
  {
    id: 'uid_5',
    name: 'email',
    type: 'text',
    placeholder: '',
    value: ''
  },
  {
    id: 'uid_7',
    name: 'password',
    type: 'password',
    placeholder: '',
    value: ''
  }
]
```

## Wait/sleep a certain amount of time
[Source](https://stackoverflow.com/a/49139664)

**Note:** This should only be used for debugging, generally it is bad practice to wait a fixed amount of time.
``` js
await new Promise(resolve => setTimeout(resolve, 5000));
```

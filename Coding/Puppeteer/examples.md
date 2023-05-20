# Puppeteer Examples

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

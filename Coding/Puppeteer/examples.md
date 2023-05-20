# Puppeteer Examples

## Wait for a selector
``` js
var login_selector = "input[id='email']"
console.log("Waiting for login selector to load...")
await page.waitForSelector(login_selector)
console.log("Login selector loaded.")
```

## Type into a field
``` js
var password_selector = "input[name='password']"
console.log("Typing in password...")
await page.type(password_selector, password)
console.log("Successfully typed in password.")
```

## Press enter on the keyboard
``` js 
console.log("Pressing Enter...")
await page.keyboard.press("Enter");
console.log("Successfully pressed Enter.")
await page.waitForNavigation();
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

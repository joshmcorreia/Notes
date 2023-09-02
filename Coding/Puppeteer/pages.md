# Pages
**Note:** In the context of puppeteer, tabs = pages

## Reuse the empty tab
```js
var browser = await puppeteer.launch({ headless: false });
var page = (await browser.pages())[0];
```

## Open a new tab
```js
var browser = await puppeteer.launch({ headless: false });
var page = browser.newPage();
```

## Open a new incognito tab
```js
const incognito_context = await browser.createIncognitoBrowserContext();
var page = await incognito_context.newPage();
```

## Close a tab
```js
var page_to_close = (await browser.pages())[0];
await page_to_close.close();
```

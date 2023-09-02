# Pages

## Reuse the empty tab page
```js
var browser = await puppeteer.launch({ headless: false });
var [page] = await browser.pages();
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

Tested on Linux Mint

## Installing nodejs
1. `sudo apt install nodejs npm -y`
2. `npm i puppeteer`
3. `mkdir puppeteer_server`
4. `touch puppet.js`
5. Copy the following into the file:
```
const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({headless: false});
  const page = await browser.newPage();
  await page.goto('https://example.com');
  await page.screenshot({ path: 'example.png' });

  await browser.close();
})();
```
6. `node puppet.js`


---

## Resources
https://nodejs.org/en/docs/guides/getting-started-guide/
https://github.com/puppeteer/puppeteer

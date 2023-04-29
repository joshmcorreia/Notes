# Puppeteer Examples

## Get a list of all links from the DOM
[Source](https://stackoverflow.com/a/49492141)
```
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

# File Downloads
[Download - Playwright Docs](https://playwright.dev/docs/api/class-download)

## Cancel file downloads
```ts
const downloadPromise = page.waitForEvent('download');
await page.getByRole('button', { name: "Agree", exact: true }).click();
const download = await downloadPromise;
await download.cancel();
```

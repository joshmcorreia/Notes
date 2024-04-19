# Locators


## Expect a title to contain a string
```js
await expect(page).toHaveTitle(/Kove Customer Portal/);
```

## Check if a button exists
```js
let has_disagree_button = await page.getByRole('button', { name: 'Disagree' }).isVisible();
```

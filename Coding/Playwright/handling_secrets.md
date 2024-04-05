# Handling Secrets

## Passing Environment Variables
[Passing Environment Variables](https://playwright.dev/docs/test-parameterize#passing-environment-variables)

In `playwright.config.ts` add the following line:
```
require('dotenv').config();
```

Create a `.env` file at the same directory level as `playwright.config.ts` and add the desired variables inside of it
```
ADMIN_PASSWORD="password1234"
```

Now in your `.spec.ts` files you can access the variables like so:
```
await page.getByPlaceholder('Password').fill(process.env.ADMIN_PASSWORD);
```

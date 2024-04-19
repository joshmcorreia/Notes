# Block Images from loading
[Block by Resource Type - zenrows](https://www.zenrows.com/blog/blocking-resources-in-playwright#type)

```python
await page.route("**/*", lambda route: route.abort()
	if route.request.resource_type == "image" else route.continue_()
)
```

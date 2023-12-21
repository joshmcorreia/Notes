# Downloads

---

## Cancel a download
[Download](https://playwright.dev/python/docs/api/class-download)
```python
# Start waiting for the download
with page.expect_download() as download_info:
    # Perform the action that initiates download
    page.get_by_text("Download file").click()
download = download_info.value
download.cancel()
```

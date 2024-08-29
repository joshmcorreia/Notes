# Dockerfiles

---

## Add a user and set them as the user that the container launches with:
``` bash
RUN useradd -m josh
WORKDIR /home/josh
USER josh
```

---

## Optimizing downloads with multi-stage `curl` images:
One way to optimize images is by removing unnecessary dependencies and files from the final image. `curl` is often used to download files, but if your final image doesn't need `curl`, you can free up some space by never installing it on the image in the first place. I found the `curlimages/curl` [Docker image](https://hub.docker.com/r/curlimages/curl) that can be used for this specific purpose.

You can use it in a multi-stage build like so (add this to your Dockerfile):
```
FROM curlimages/curl:7.83.1 AS file_downloader
WORKDIR /home/curluser
RUN curl -O https://www.google.com/my_folder.zip

COPY --from=file_downloader /home/curluser/my_folder.zip /home/josh
```

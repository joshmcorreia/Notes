# Docker Image Creation

---

## Building Docker images from a Dockerfile:
```bash
docker build -f {DOCKERFILE} -t {DESIRED_IMAGE_NAME}:{DESIRED_TAG_NAME} .
```
Example:
```bash
docker build -f build_x86_64.Dockerfile -t x86_64:latest .
```

---

## Building Docker images without cache (clean build):
[docker build Documentation](https://docs.docker.com/engine/reference/commandline/build/)

```bash
docker build -f build_x86_64.Dockerfile -t x86_64:latest . --no-cache
```

---

## Add a user and set them as the user that the container launches with:
``` bash
RUN useradd -m hublink
WORKDIR /home/hublink
USER hublink
```

---

## Viewing the size of each layer in an image:
```bash
docker history my_image
```

---

## When to combine RUN commands:
When commands are tightly connected, such as running `apt update` followed by the installation of a package, be sure to combine them into a single RUN command. This will ensure that the cache does not have old `apt update` information when installing the package. More information on this can be found [here](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run).

---

## Optimize Windows Dockerfiles:
[This article](https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/optimize-windows-dockerfile) talks specifically about optimizing Dockerfiles on Windows.

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

---

## Cloning private repositories:
When cloning private repositories it is unsafe to store a private key inside of your Docker image because attackers can re-use your private key to impersonate you. Instead of storing the private key in the Docker image, you can use the SSH mount type when building your image. More information can be found [here](https://docs.docker.com/develop/develop-images/build_enhancements/#using-ssh-to-access-private-data-in-builds).

Make sure to add the ssh flag when building:
```bash
docker build --ssh default -f build_x86_64.Dockerfile -t x86_64:latest .
```

I've experienced issues during the clone stage on macOS and had to run `ssh-add --apple-use-keychain`. [Source](https://superuser.com/a/1724438/)

---

## Running update/upgrade inside of Dockerfiles:
When building Docker images, it's almost always a good idea to update the packages inside of the Dockerfile (ex: `apt-get update && apt-get upgrade`). This ensures that security vulnerabilities are fixed since you often cannot rely on the base image maintainer to frequently update the image. Relevant article [here](https://pythonspeed.com/articles/security-updates-in-docker/).

---

## Building build images in pipelines:
A great way to speed up pipelines is by building your build images themselves. Basically you automate building the exact image that you need for building software in a pipeline in order to speed up each build process. For example if your build process relies on another Git project (call it Project-A), it makes more sense to build a new Docker image every time that Project-A changes and then use the newly created Docker image in your pipeline. This means that you won't need to `git pull` every time that your pipeline runs, which in turn saves time.

Here is an article that talks about just this:
- https://about.gitlab.com/blog/2019/08/28/building-build-images/

# Docker Q&A

### What are Docker images?
"A Docker image is a read-only template that contains a set of instructions for creating a container that can run on the Docker platform. It provides a convenient way to package up applications and preconfigured server environments" ([Source](https://jfrog.com/knowledge-base/a-beginners-guide-to-understanding-and-building-docker-images/))

### What are Docker containers?
Docker containers are running instances of Docker images. When you run an image, a container is created.

### How are Docker containers different from VMs?
- Docker containers do not contain their own kernel, so they use the kernel of the host Operating System. This allows Docker images to be much smaller than VMs. 
- Docker containers are faster than VMs because you do not have to boot up the kernel and applications every time.
- One of the drawbacks of using the kernel of the host OS is that the image may not be compatible, such as trying to run a Linux image on a Windows host OS.

### How can MacOS (x86_64) run ARM containers?
This involves a bit of magic that I don't fully understand yet, but you can read more about that [here](https://stackoverflow.com/questions/66350893/why-macosx86-can-run-docker-arm-container-arm64v8-alpine).

---

# Docker Commands

### Download an existing Docker image:
```bash
docker pull ubuntu
```

### Download an existing Docker image on a specific tag:
```bash
docker pull ubuntu:focal
```

### List your current docker images:
```bash
docker image ls
```

### Run a docker image:
```bash
docker run -it ubuntu:focal # -it stands for interactive
```
If you wish to name your docker container while running it:
```bash
docker run --name MyUbuntuContainer -it ubuntu:focal
```

### Run a Docker image with a specific platform:
```bash
docker run --platform linux/arm/v7 -it ubuntu:focal
```

### Start a docker container:
```bash
docker start MyUbuntuContainer
```

### Stop a docker container:
Note: this is equivalent to sending a SIGTERM to the main process in the container
```bash
docker stop MyUbuntuContainer
```

### Kill a docker container:
Note: this is equivalent to sending a SIGKILL to the main process in the container
```bash
docker kill MyUbuntuContainer
```

### Pause a docker container:
```bash
docker pause MyUbuntuContainer
```

### Unpause a docker container:
```bash
docker unpause MyUbuntuContainer
```

### Snapshot a docker container:
Note: committing a container saves it as a new image
```bash
docker commit {IMAGE_NAME} {NEW_SNAPSHOT_NAME}

docker commit MyUbuntuContainer ubuntu_container_snapshot
```

### Delete a docker image:
```bash
docker image rm ubuntu
```
OR
```bash
docker rmi ubuntu
```

### Delete a docker container:
```bash
docker rm MyUbuntuContainer
```

### List your current docker containers:
```bash
docker container ls
```
OR
```bash
docker ps
```

### Attach to a running docker container:
```bash
docker attach adoring_turing # where adoring_turing is the name of the docker container
```

### Detach from a docker container:
<kbd>CTRL</kbd>+<kbd>P</kbd>+<kbd>Q</kbd>

### Copy files from a docker container to the host machine:
```
docker cp adoring_turing:/home/josh/file.txt .
```

---

## Docker Image Creation

### Building Docker images from a Dockerfile:
```bash
docker build -f {DOCKERFILE} -t {DESIRED_IMAGE_NAME}:{DESIRED_TAG_NAME} .
```
Example:
```bash
docker build -f Dockerfile.build_x86_64 -t x86_64:latest .
```

### Viewing the size of each layer in an image:
```bash
docker history my_image
```

### When to combine RUN commands:
When commands are tightly connected, such as running `apt update` followed by the installation of a package, be sure to combine them into a single RUN command. This will ensure that the cache does not have old `apt update` information when installing the package. More information on this can be found [here](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run).

### Optimizing downloads with multi-stage `curl` images:
One way to optimize images is by removing unnecessary dependencies and files from the final image. `curl` is often used to download files, but if your final image doesn't need `curl`, you can free up some space by never installing it on the image in the first place. I found the `curlimages/curl` [Docker image](https://hub.docker.com/r/curlimages/curl) that can be used for this specific purpose.

You can use it in a multi-stage build like so (add this to your Dockerfile):
```
FROM curlimages/curl:7.83.1 AS file_downloader
WORKDIR /home/curluser
RUN curl -O https://www.google.com/my_folder.zip

COPY --from=file_downloader /home/curluser/my_folder.zip /home/josh
```

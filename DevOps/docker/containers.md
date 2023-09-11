# Connecting to containers

---

## Run a docker image (creates a container):
```bash
docker run -it ubuntu:focal # -it stands for interactive
```
If you wish to name your docker container while running it:
```bash
docker run --name MyUbuntuContainer -it ubuntu:focal
```

---

## Run a docker image with a specific platform (creates a container):
```bash
docker run --platform linux/arm/v7 -it ubuntu:focal
```

---

## Start an existing docker container:
```bash
docker start MyUbuntuContainer
```

---

## Stop a running docker container:
Note: this is equivalent to sending a SIGTERM to the main process in the container
```bash
docker stop MyUbuntuContainer
```

---

## Kill a docker container:
Note: this is equivalent to sending a SIGKILL to the main process in the container
```bash
docker kill MyUbuntuContainer
```

---

## Pause a docker container:
```bash
docker pause MyUbuntuContainer
```

---

## Unpause a docker container:
```bash
docker unpause MyUbuntuContainer
```

---

## Snapshot a docker container:
Note: committing a container saves it as a new image
```bash
docker commit {IMAGE_NAME} {NEW_SNAPSHOT_NAME}

docker commit MyUbuntuContainer ubuntu_container_snapshot
```

---

## Delete a docker container:
```bash
docker rm MyUbuntuContainer
```

---

## List all docker containers:
```bash
docker container ls
```
OR
```bash
docker ps
```

---

## Attach to a running docker container:
```bash
docker attach adoring_turing # where adoring_turing is the name of the docker container
```

**NOTE:** If you exit the container without detaching, the container will stop.

---

## Detach from a docker container:
<kbd>CTRL</kbd>+<kbd>P</kbd>+<kbd>Q</kbd>

---

## Copy files from a docker container to the host machine:
```
docker cp adoring_turing:/home/josh/file.txt .
```

---

## Copy files from the host machine to a docker container:
```
docker cp foo.txt container_id:/foo.txt
```
[Source](https://stackoverflow.com/a/31971697)

---

## Remove unused containers:
```
docker container prune
```

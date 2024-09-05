# Docker Images

---

## Download an existing Docker image:
```
docker pull ubuntu
```

---

## Download an existing Docker image with a specific tag:
```
docker pull ubuntu:focal
```

---

## List your current docker images:
```
docker image ls
```

---

## Delete a docker image:
```
docker image rm ubuntu
```
OR
```
docker rmi ubuntu
```

---

## Delete unused images
[docker image prune](https://docs.docker.com/reference/cli/docker/image/prune/)
```
docker image prune
```

---

## Delete images that are X hours old
[docker image prune](https://docs.docker.com/reference/cli/docker/image/prune/)
```
docker image prune -a --force --filter "until=24h"
```
This will delete all images that are greater than 24 hours old.

---

## Delete images with a specific label
```
docker image prune -a --filter "label=maintainer='Red Hat, Inc.'"
```

# Docker Images

---

## Download an existing Docker image:
```bash
docker pull ubuntu
```

---

## Download an existing Docker image with a specific tag:
```bash
docker pull ubuntu:focal
```

---

## List your current docker images:
```bash
docker image ls
```

---

## Delete a docker image:
```bash
docker image rm ubuntu
```
OR
```bash
docker rmi ubuntu
```

---

## Remove unused images
[docker image prune](https://docs.docker.com/engine/reference/commandline/image_prune/)
```bash
docker image prune
```

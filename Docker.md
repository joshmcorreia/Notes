# Docker

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
docker run -it ubuntu:focal
```

### List your current docker containers:
```bash
docker container ls
```

### Connect to an existing docker container:
```bash
docker attach adoring_turing # where adoring_turing is the name of the docker container
```

### Detach from a docker container:
<kbd>CTRL</kbd>+<kbd>P</kbd>+<kbd>Q</kbd>

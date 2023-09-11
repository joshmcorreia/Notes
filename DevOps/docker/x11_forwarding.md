# X11 Forwarding with Docker

## X11 Forwarding on Windows 11 with WSL2:
[How to show GUI apps from docker desktop container on windows 11](https://stackoverflow.com/q/73092750)

First is `x11test.Dockerfile`:
```
FROM ubuntu:jammy
RUN apt update -y && apt install -y x11-apps
```

Build the docker container:
```
docker build -t x11test -f x11test.Dockerfile .
```

Run the docker container:
```
docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY x11test
```

Run the following command in the container:
```
xeyes
```
If X11 forwarding is working properly, the `xeyes` window will pop up on your screen.

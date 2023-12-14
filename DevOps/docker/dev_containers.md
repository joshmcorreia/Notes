# Docker Dev Containers
These are instructions on how to set up "dev" containers. These aren't an official thing made by Docker, I'm just choosing to call them that because they're what I use for development.

## With X11 Forwarding
`dev.Dockerfile`:
```
# To build this Dockerfile, run the following command:
# docker build -t my-project-dev -f dev.Dockerfile .

# To run this docker container run the following command:
# docker run --name my-project-dev -it -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/root/my-project -e DISPLAY my-project-dev

FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive

# x11-apps lets us use x11 forwarding
RUN apt -y update && apt install -y x11-apps
```

This works by using a bind mount to mount `$(pwd)` on the host to `/root/my-project` inside of the container. Changes made on the host folder will be synced between the container and vice-versa which is great for development. This makes it so you don't have to rebuild the Docker container every time you want to test a change.

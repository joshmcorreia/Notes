# Docker Dev Containers
These are instructions on how to set up "dev" containers. These aren't an official thing made by Docker, I'm just choosing to call them that because they're what I use for development.

---

## Sharing code between a container and the host
To share your code between a container and the host you can use the volume flag `-v $(pwd):/root/my-project`.

This works by using a bind mount to mount `$(pwd)` on the host to `/root/my-project` inside of the container. Changes made on the host folder will be synced between the container and vice-versa which is great for development. This makes it so you don't have to rebuild the Docker container every time you want to test a change.

---

## With X11 Forwarding
For information on how to set up dev containers with X11 forwarding, see the [x11_forwarding](./x11_forwarding/) folder.

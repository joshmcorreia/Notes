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

# Set the timezone of a Docker image:
[How do I change timezone in a docker container?](https://stackoverflow.com/a/57608215)
By default, all containers use the UTC timezone.

This can be changed in the Dockerfile:
```
FROM ubuntu:jammy

ENV TZ="America/Los_Angeles"
```

---

# Set the timezone of a Docker container using Docker compose:
[How do I change timezone in a docker container?](https://stackoverflow.com/a/67054850)

Add the following to your docker compose file:
```
environment:
  - TZ=America/Los_Angeles
```

---

# Sync the timezone of a Docker container to the host:
[How do I change timezone in a docker container?](https://stackoverflow.com/a/67054850)

Add the following to your docker compose file:
```
volumes:
  - /etc/timezone:/etc/timezone:ro
  - /etc/localtime:/etc/localtime:ro
```

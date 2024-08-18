# To build this Dockerfile, run the following command:
# docker build -t windows_x11_forwarding -f windows_x11_forwarding.Dockerfile .

# To run this docker container run the following command:
# docker run --name windows_x11_forwarding -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY windows_x11_forwarding

FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive

# x11-apps lets us use x11 forwarding
RUN apt -y update && apt install -y x11-apps

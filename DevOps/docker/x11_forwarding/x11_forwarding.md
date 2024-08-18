# X11 Forwarding with Docker

## X11 Forwarding on Windows 11 with WSL2:
[How to show GUI apps from docker desktop container on windows 11](https://stackoverflow.com/q/73092750)

See the instructions in `windows_x11_forwarding.Dockerfile`.

To test that the container is working, run the following command in the container:
```
xeyes
```
If X11 forwarding is working properly, the `xeyes` window will pop up on your screen.

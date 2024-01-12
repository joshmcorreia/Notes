# Wireguard Server (Docker)
For documentation, see [docker-wireguard](https://github.com/linuxserver/docker-wireguard)

## Connect to the docker container
```
$ docker exec -it wireguard /bin/bash
```

## Monitor the logs
```
docker logs -f wireguard
```

## Get the QR code of a specific peer
```
$ docker exec -it wireguard /app/show-peer 1
```

## View which peers are connected
```
$ docker exec -it wireguard wg show
```

## How to move the Docker data directory
[Source](https://www.guguweb.com/2019/02/07/how-to-move-docker-data-directory-to-another-location-on-ubuntu/)

This will help you avoid the error `no space left on device`.

1. Stop docker
    ```
    sudo systemctl stop docker
    ```
2. Create a docker configuration file
    ```
    sudo vim /etc/docker/daemon.json
    ```
    and paste the following inside of it
    ```
    {
        "data-root": "/home/docker"
    }
    ```
    You can change this depending on where you have more space on your filesystem
3. Copy the old docker data to the new location
    ```
    sudo rsync -aP /var/lib/docker/ /home/docker
    ```
4. Rename the old docker directory
    ```
    sudo mv /var/lib/docker /var/lib/docker.old
    ```
5. Restart the docker daemon
    ```
    sudo systemctl restart docker
    ```
6. Test to make sure all of your containers show up
    ```
    sudo docker container ls -a
    ```
    If your containers do not show up here then something went wrong and you should **NOT** move on to the next step.
7. Remove the old docker directory
    ```
    sudo rm /var/lib/docker.old
    ```

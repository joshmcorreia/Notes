# Self Hosted GitLab Server

## Docker Install
[Source](https://docs.gitlab.com/ee/install/docker.html)

1. Download the Docker container
    ```
    docker pull gitlab/gitlab-ee:15.10.7-ee.0
    ```
2. Set the environment variables
    ```
    export GITLAB_HOME=/srv/gitlab
    ```
3. Run the Docker container
    ```
    sudo docker run --detach \
    --hostname gitlab.josh.com \
    --publish 443:443 --publish 80:80 --publish 22:22 \
    --name gitlab \
    --restart always \
    --volume $GITLAB_HOME/config:/etc/gitlab \
    --volume $GITLAB_HOME/logs:/var/log/gitlab \
    --volume $GITLAB_HOME/data:/var/opt/gitlab \
    --shm-size 256m \
    gitlab/gitlab-ee:15.10.7-ee.0
    ```
4. Give the server some time to load, then you can access the server at whatever you set the hostname to in step 3, in this case `gitlab.josh.com`

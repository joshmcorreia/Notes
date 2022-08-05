# GitLab Container Registry
GitLab has the ability to store Docker containers in its [container registry](https://docs.gitlab.com/ee/user/packages/container_registry/). This is a great alternative to uploading to the Docker Hub because it is privately stored on your GitLab server.

## Generate a Docker deploy access token
Before uploading to the GitLab Container Registry, you must generate a Docker deploy token. This allows you to log into the GitLab server which will then allow you to upload your containers. To create/view your access tokens click your profile picture in the top right of the screen and click "Edit Profile" then navigate to "Access Tokens" on the left hand side of the screen.

## Docker Login
Before uploading to the GitLab Container Registry, you must log in
```
docker login gitlab.josh.com:5005
> enter username when prompted
> enter password (docker deploy token) when prompted
```

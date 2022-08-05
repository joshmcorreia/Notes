# GitLab Container Registry
GitLab has the ability to store Docker containers in its [container registry](https://docs.gitlab.com/ee/user/packages/container_registry/). This is a great alternative to uploading to the Docker Hub because it is privately stored on your GitLab server.

## Generate a Docker deploy access token
1. Navigate to your personal access token page (click your profile pic in the top right, click "Edit Profile", then click "Access Tokens" on the left hand side of the screen)
2. Give the Access Token a name (I chose "docker_cli")
3. Select the scope (I chose "api")
4. Click "Create personal access token"
5. Save the generated access token that is displayed on the screen, preferably storing it in a password manager. You won't be able to access it again after navigating away from the page.

## Docker Login
Before uploading to the GitLab Container Registry, you must log in
```
docker login gitlab.josh.com:5005
> enter username when prompted
> enter password (docker deploy token) when prompted
```

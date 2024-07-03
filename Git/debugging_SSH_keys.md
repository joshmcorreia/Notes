# Debugging SSH Keys

---

## Check that you actually added your public key to the Git server
GitHub URL:
```
https://github.com/settings/keys
```

GitLab URL:
```
https://{GITLAB_URL}/-/user_settings/ssh_keys
```

GitLab deploy keys:
```
https://{GITLAB_URL}/dev/{PROJECT_NAME}/-/settings/repository#js-deploy-keys-settings
```

---

## Debug with SSH logs
It's important to know how `git clone` works behind the scenes. You're actually SSHing to the server as the `git` user, so you can use this tip to get more logging information:
```
$ ssh git@{GIT_SERVER} -vvv
```
For example:
```
$ ssh git@gitlab.lan -vvv
```

For more information, see [Linux - Debugging SSH keys](../Linux/debugging_SSH_keys.md).

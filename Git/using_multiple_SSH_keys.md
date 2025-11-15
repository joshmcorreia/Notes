# Using Multiple SSH Keys
Sometimes I need to use multiple SSH keys across different projects, such as having two different GitHub accounts. Since GitHub doesn't let you upload the same public key to multiple accounts, you have to create multiple keypairs. Having multiple keypairs means that you need to tell the Git client how to associate each SSH key with each repo.

[How do I use multiple SSH keys on GitHub?](https://stackoverflow.com/a/61150726)

Basically all you have to do is update `~/.ssh/config` like so:
```
Match host github.com exec "[ $(git config user.email) = joshworkaddress@gmail.com ]"
    IdentityFile ~/.ssh/id_ed25519_work

Host github.com
    IdentityFile ~/.ssh/id_ed25519
```

# Remove your Git global config!
To avoid accidentally pushing from the wrong account, I recommend removing your email and name from the global config:
```
$ git config --global --unset user.email
$ git config --global --unset user.name
```
This will force you to set up the correct account for each repo and ensures that you never push from the wrong account.

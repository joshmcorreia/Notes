# git-lfs
[Source](https://github.com/git-lfs/git-lfs)<br>
[Source 2](https://git-lfs.com/)

## Ubuntu 22.04 Installation
[Source](https://github.com/git-lfs/git-lfs/blob/main/INSTALLING.md)
1. First add the packagecloud repository
    ```
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
    ```
2. Install git-lfs
    ```
    sudo apt-get install git-lfs
    ```

## Adding git-lfs to your repository
1. Change directories into your git repo
    ```
    cd ~/test_git_lfs
    ```
2. Install git lfs in your repo
    ```
    $ git lfs install
    Updated Git hooks.
    Git LFS initialized.
    ```
3. Associate your desired file extensions with git lfs
    ```
    $ git lfs track "*.png"
    Tracking "*.png"
    ```
4. Track your `.gitattributes` file
    ```
    git add .gitattributes
    ```

## File Size Limitations
It is important to note that there are limitations when it comes to the Git server you are using.

For example, GitHub only allows a [2GB of storage for the free tier](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-git-large-file-storage#about-git-large-file-storage). After hitting the limit the new files will be silently rejected. This is obviously not ideal when you need to store large amounts of data.

GitLab offers [5GB of storage for the free tier](https://about.gitlab.com/pricing/).

## Self-hosting a git-lfs server
TODO

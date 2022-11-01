# Package Installation

## Ubuntu dpkg frontend lock
A common issue on Ubuntu, which is usually encountered during an update or when a system first boots up, is the `Unable to acquire the dpkg frontend lock` message. This happens because dpkg is already being used by the UI updater, but you are trying to access it via a terminal.

Thankfully, someone created a [great script for this on the askubuntu forum](https://askubuntu.com/a/375031). In case that post is ever deleted in the future, it can be installed as follows:

```
sudo touch /usr/local/sbin/apt-get
sudo chmod +x /usr/local/sbin/apt-get
sudo vim /usr/local/sbin/apt-get
```
Then paste the following contents into the file:
```
#!/bin/bash

i=0
tput sc
while fuser /var/lib/dpkg/lock >/dev/null 2>&1 ; do
    case $(($i % 4)) in
        0 ) j="-" ;;
        1 ) j="\\" ;;
        2 ) j="|" ;;
        3 ) j="/" ;;
    esac
    tput rc
    echo -en "\r[$j] Waiting for other software managers to finish..." 
    sleep 0.5
    ((i=i+1))
done 

/usr/bin/apt-get "$@"
```

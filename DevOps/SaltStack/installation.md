# Salt Project Installation

## Ubuntu 22.04 Install - Salt 3006.1 - Salt Master
[Source](https://docs.saltproject.io/salt/install-guide/en/latest/topics/install-by-operating-system/ubuntu.html)

**Note:** Tested on 5/5/2023
```
sudo apt-get install curl

sudo curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring-2023.gpg https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/SALT-PROJECT-GPG-PUBKEY-2023.gpg
echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring-2023.gpg arch=amd64] https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/latest jammy main" | sudo tee /etc/apt/sources.list.d/salt.list

sudo apt-get update
sudo apt-get install salt-master -y

sudo systemctl enable salt-master && sudo systemctl start salt-master
```

## Ubuntu 22.04 Install - Salt 3006.1 - Salt Minion
[Source](https://docs.saltproject.io/salt/install-guide/en/latest/topics/install-by-operating-system/ubuntu.html)

**Note:** Tested on 5/5/2023
```
sudo apt-get install curl

sudo curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring-2023.gpg https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/SALT-PROJECT-GPG-PUBKEY-2023.gpg
echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring-2023.gpg arch=amd64] https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/latest jammy main" | sudo tee /etc/apt/sources.list.d/salt.list

sudo apt-get update
sudo apt-get install salt-minion -y

sudo systemctl enable salt-minion && sudo systemctl start salt-minion
```

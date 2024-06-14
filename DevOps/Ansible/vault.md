# Ansible Vault

- [Protecting sensitive data with Ansible vault](https://docs.ansible.com/ansible/latest/vault_guide/index.html)
- [How to store ansible_become_pass in a vault and how to use it?](https://stackoverflow.com/a/54466767)

## Encrypt an existing file with ansible vault
```
$ ansible-vault encrypt ~/my_file
```

## View the contents of an ansible vault file
```
$ ansible-vault view ~/my_file
```

## Edit the contents of an ansible vault file
```
$ ansible-vault edit ~/my_file
```

## Securely storing passwords in the ansible vault
1. Create a host_vars file for each machine in your inventory
    ```
    $ mkdir /etc/ansible/host_vars/mail.example.com
    ```
1. Create a vault file for each machine in your inventory
    ```
    ansible-vault create /etc/ansible/host_vars/mail.example.com/encrypted.yaml
    ```
1. Store the necessary password information in your vault file
    ```
    ansible_become_pass: "my_secure_pass"
    ```

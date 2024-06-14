# Ansible Hosts

By default the Ansible hosts file is located at `/etc/ansible/hosts`.

## Example hosts file
Here is an [example hosts file](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#inventory-basics-formats-hosts-and-groups) in YAML format:
```
ungrouped:
  hosts:
    mail.example.com:
webservers:
  hosts:
    foo.example.com:
    bar.example.com:
dbservers:
  hosts:
    one.example.com:
    two.example.com:
    three.example.com:
```

## Set the user to SSH as
```
ungrouped:
  hosts:
    mail.example.com:
      ansible_user: josh
```

## Set the SSH sudo password
To securely store the SSH sudo password, see [vault.md](./vault.md#securely-storing-passwords-in-the-ansible-vault)

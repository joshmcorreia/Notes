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

## Set the remote ansible temp directory
[POSIX shell - remote_tmp](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/sh_shell.html#parameter-remote_tmp)

Sometimes there are scenarios when you need to change the temp directory due to environment restrictions - I specifically encountered this in an environment where I had a shared `~/` across all machines, so writing to `~/.ansible` caused issues.
```
mail.example.com:
  ansible_remote_tmp: /tmp/.ansible
```

## Specify the Python interpreter
[Connecting to hosts: behavioral inventory parameters](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#connecting-to-hosts-behavioral-inventory-parameters)

```
mail.example.com:
  ansible_python_interpreter: /usr/bin/python3
```

## Set the SSH sudo password
To securely store the SSH sudo password, see [vault.md](./vault.md#securely-storing-passwords-in-the-ansible-vault)

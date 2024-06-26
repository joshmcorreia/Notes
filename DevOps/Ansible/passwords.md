# Passwords

---

## Prompt for the SSH password
[Ask for the SSH password](https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html#cmdoption-ansible-playbook-k)

Add `--ask-pass` to your `ansible-playbook` command:
```
ansible-playbook -i inventory.yaml --ask-pass install_thing.yaml
```

This allows you to SSH to the host without having to set up SSH keys first.

---

## Prompt for the sudo password
[Specify sudo password for Ansible](https://stackoverflow.com/a/27153708)

Add `--ask-become-pass` to your `ansible-playbook` command:
```
ansible-playbook -i inventory.yaml --ask-become-pass install_thing.yaml
```

---

## Storing passwords without needing to prompt for them
To securely store passwords, see [vault.md](./vault.md#securely-storing-passwords-in-the-ansible-vault)

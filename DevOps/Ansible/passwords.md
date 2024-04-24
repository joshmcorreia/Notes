# Passwords

---

## Prompt for the SSH password
[Ask for the SSH password](https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html#cmdoption-ansible-playbook-k)

Add `--ask-pass` to your `ansible-playbook` command:
```
ansible-playbook -i inventory.yaml --ask-pass install_thing.yaml
```

---

## Prompt for the sudo password
[Specify sudo password for Ansible](https://stackoverflow.com/a/27153708)

Add `--ask-become-pass` to your `ansible-playbook` command:
```
ansible-playbook -i inventory.yaml --ask-become-pass install_thing.yaml
```

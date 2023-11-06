# Ansible Playbooks
[Creating a playbook](https://docs.ansible.com/ansible/latest/getting_started/get_started_playbook.html)

## Run a playbook
```
ansible-playbook -i inventory.yaml playbook.yaml
```

## Ping a machine
```
- name: Ping a machine
  hosts: virtual_machines
  tasks:
   - name: Ping my hosts
     ansible.builtin.ping:
```

## Create a user
```
ansible-playbook -i inventory.yaml create_user.yaml --ask-become-pass
```
`create_user.yaml`:
```
- name: Create a user
  hosts: virtual_machines
  tasks:
  - name: Create the `kiara` user
    become: true
    ansible.builtin.user:
      name: kiara
      shell: /bin/zsh
      groups: sudo
      append: yes
```

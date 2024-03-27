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

## Check that the target is in a list of supported Operating Systems
```
  tasks:
  - name: Check for supported OS distribution
    fail: msg="The target uses an unsupported operating system '{{ ansible_distribution}}'."
    when:
      - ansible_facts['distribution'] != "RedHat"
  - name: Check for supported OS version
    fail: msg="The target uses an unsupported operating system version '{{ ansible_facts['distribution_version']}}'."
    when:
      - ansible_facts['distribution_version'] not in ["9.1", "9.2", "9.3"]
```

# Ansible Playbooks
[Creating a playbook](https://docs.ansible.com/ansible/latest/getting_started/get_started_playbook.html)

---

## Run a playbook
```
ansible-playbook -i inventory.yaml playbook.yaml
```

---

## Ping a machine
```yaml
- name: Ping a machine
  hosts: virtual_machines
  tasks:
   - name: Ping my hosts
     ansible.builtin.ping:
```

---

## Create a user
```
ansible-playbook -i inventory.yaml create_user.yaml --ask-become-pass
```
`create_user.yaml`:
```yaml
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

---

## Check that the target is in a list of supported Operating Systems
```yaml
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

---

## Specify the user to SSH as

Add `remote_user:` to your playbook file:
```yaml
- name: Install thing
  hosts: server
  remote_user: root
  become: true
  tasks:
```

---

## Get all IPv6 addresses
```yaml
- hosts:
    - machine_1
    - machine_2
  gather_facts: true
  gather_subset:
    - all_ipv6_addresses
  tasks:
  - name: Store IPv6 addresses
    set_fact:
      ipv6_addresses: "{{ hostvars | json_query('*.ansible_all_ipv6_addresses[]') | sort}}"
    run_once: true

  - name: Print all IPv6 addresses
    debug:
      msg: "{{ ipv6_addresses }}"
    run_once: true
```
Example execution:
```
TASK [Gathering Facts] **********************************
ok: [machine_1]
ok: [machine_2]

TASK [Store IPv6 addresses] *****************************
ok: [machine_1]

TASK [Print all IPv6 addresses] *************************
ok: [machine_1] => {
    "msg": [
        "fe80::966d:aeff:fe00:6680",
        "fe80::966d:aeff:fe00:ac70"
    ]
}
```

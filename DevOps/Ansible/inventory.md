# Ansible Inventory
[Building an inventory](https://docs.ansible.com/ansible/latest/getting_started/get_started_inventory.html)

## Sample inventory file
`inventory.yaml`:
```
physical_machines:
  hosts:
    obsidian:
      ansible_host: 192.168.1.68

virtual_machines:
  hosts:
    test_vm:
      ansible_host: 172.31.57.159
```

## Verify your inventory
```
$ ansible-inventory -i inventory.yaml --list
{
    "_meta": {
        "hostvars": {
            "obsidian": {
                "ansible_host": "192.168.1.68"
            },
            "test_vm": {
                "ansible_host": "172.31.57.159"
            }
        }
    },
    "all": {
        "children": [
            "physical_machines",
            "ungrouped",
            "virtual_machines"
        ]
    },
    "physical_machines": {
        "hosts": [
            "obsidian"
        ]
    },
    "virtual_machines": {
        "hosts": [
            "test_vm"
        ]
    }
}
```

## Ping all nodes in your inventory
```
$ ansible all -m ping -i inventory.yaml
test_vm | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
obsidian | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

## Ping a group of nodes in your inventory
```
$ ansible physical_machines -m ping -i inventory.yaml
obsidian | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

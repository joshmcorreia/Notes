# virsh

---

## Forcefully stop a VM
```
$ virsh destroy my_vm_name
```

---

## Delete a VM
```
$ virsh undefine my_vm_name
```

---

## Connect to the console of a VM
```
$ virsh console my_vm_name
```

---

## Get the IP address of a VM
```
$ virsh net-dhcp-leases default
```

---

## List all networks
```
$ virsh net-list --all
```

---

## Forcefully stop a network interface
```
$ virsh net-destroy my_network_name
```

---

## Delete a network interface
```
$ virsh net-undefine my_network_name
```

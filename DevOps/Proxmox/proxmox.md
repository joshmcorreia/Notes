# Proxmox

---

## List all VMs on the current node
```
$ sudo qm list
```

---

## List all VMs on the cluster
```
$ sudo pvesh get /cluster/resources --type vm
```
OR
```
$ sudo pvesh get /cluster/resources --type vm --output=json-pretty
```

---

## Get the next available VM ID on the cluster
```
$ sudo pvesh get /cluster/nextid
148
```

---

## List all images on the current node
```
ls /var/lib/vz/images
```

---

## Verify image format
```
$ qemu-img info test-image.qcow
image: test-image.qcow
file format: qcow2
virtual size: 20 GiB (21484431360 bytes)
disk size: 1.88 GiB
cluster_size: 65536
Format specific information:
    compat: 0.10
    compression type: zlib
    refcount bits: 16
```

---

## Create a VM from a qcow2 image
```
$ sudo qm create 1000 -scsi0 local:0,import-from=/var/lib/vz/images/1000/test-vm.qcow2 --name qcow-test
Formatting '/var/lib/vz/images/1000/vm-1000-disk-0.raw', fmt=raw size=21484431360 preallocation=off
transferred 0.0 B of 20.0 GiB (0.00%)
...
transferred 20.0 GiB of 20.0 GiB (100.00%)
scsi0: successfully created disk 'local:1000/vm-1000-disk-0.raw,size=20980890K'
```

---

## Attach a disk to a VM
[Documentation](https://pve.proxmox.com/pve-docs/qm.1.html)
```
$ sudo qm disk import 148 test-vm.qcow2 local
importing disk 'test-vm.qcow2' to VM 148 ...
Formatting '/var/lib/vz/images/148/vm-148-disk-1.raw', fmt=raw size=21484431360 preallocation=off
transferred 0.0 B of 20.0 GiB (0.00%)
...
transferred 20.0 GiB of 20.0 GiB (100.00%)
Successfully imported disk as 'unused0:local:148/vm-148-disk-1.raw'
```

---

## Detach a disk from a VM on the current node
**Note:** This will detach the disk from the VM but it still needs to be deleted.
```
$ sudo qm set 148 --delete scsi0
update VM 148: -delete scsi0
```

---

## Detach a disk from a VM on the cluster
**Note:** This will detach the disk from the VM but it still needs to be deleted.
```
$ sudo pvesh set /nodes/{node_name}/qemu/{vm_id}/config --delete "{disk_name}"
```
Example:
```
$ sudo pvesh set /nodes/vh8/qemu/352/config --delete "sata0"
```

---

## Delete a disk from a VM on the current node
```
$ sudo qm set {vm_id} --delete {disk_name}
```
Example:
```
$ sudo qm set 148 --delete unused0
update VM 148: -delete unused0
```

---

## Delete a disk from a VM on the cluster
```
$ sudo pvesh set /nodes/{node_name}/qemu/{vm_id}/config --delete "{disk_name}"
```
Example:
```
$ sudo pvesh set /nodes/vh8/qemu/352/config --delete "unused0"
Removing image: 33% complete...
Removing image: 66% complete...
Removing image: 100% complete...done.
```

---

## Start a VM on the cluster
```
$ sudo pvesh create /nodes/{node_name}/qemu/{vm_id}/status/start
```
Example:
```
$ sudo pvesh create /nodes/vh8/qemu/352/status/start
UPID:vh8:0030FB2D:330ECAE5:65665EEA:qmstart:352:root@pam:
```

---

## Stop a VM on the cluster
```
$ sudo pvesh create /nodes/{node_name}/qemu/{vm_id}/status/stop
```
Example:
```
$ sudo pvesh create /nodes/vh8/qemu/352/status/stop
UPID:vh8:0030D076:330E721A:65665E07:qmstop:352:root@pam:
```

---

## Get VM resource information
```
$ sudo pvesh get /cluster/resources --type vm
```

---

## Get config info for a specific VM on the current node
```
$ sudo qm config 148
boot:
meta: creation-qemu=7.2.0,ctime=1700604130
name: jenkins-pipeline-28
scsi0: local:148/vm-148-disk-0.raw,size=20980890K
smbios1: uuid=f2065a25-3992-48a6-bffd-5df4113690ad
vmgenid: a549306c-431d-4fb3-a1bd-fe63e347b2fb
```

---

## Get config info for a specific VM on the cluster
```
$ sudo pvesh get /nodes/{node_name}/qemu/{vm_id}/config
```
Example:
```
$ sudo pvesh get /nodes/vh8/qemu/352/config --output=json-pretty
{
  "boot": "nc",
  "bootdisk": "sata0",
  "cores": 1,
  "digest": "38e263c13085661b1065f6d6a216e9be74a4fe35",
  "memory": 8192,
  "name": "testmachine1",
  "net0": "e1000=BE:E3:46:D3:45:CA,bridge=vmbr0",
  "numa": 0,
  "ostype": "l26",
  "sata0": "ceph:vm-352-disk-0,backup=0,cache=writeback,size=20G",
  "smbios1": "uuid=cd6890c1-aeb1-40a0-b376-89243988cdfb",
  "sockets": 2,
  "tablet": 0
}
```

---

## List all hard disks for a specific VM on the cluster
When using local storage:
```
$ sudo pvesm list local --vmid 148
Volid                       Format  Type             Size VMID
local:148/vm-148-disk-0.raw raw     images    21484431360 148
```
or for ceph storage:
```
$ sudo pvesm list ceph --vmid 381
Volid              Format  Type             Size VMID
ceph:vm-381-disk-0 raw     images    34359738368 381
```

---

## List all attached hard disks for a specific VM on the current node
```
$ sudo qm config {vm_id} | grep "size=" | awk '{print $1}' | cut -d ":" -f 1
```
Example:
```
$ sudo qm config 148 | grep "size=" | awk '{print $1}' | cut -d ":" -f 1
scsi0
```

---

## List all attached hard disks for a specific VM on the cluster
```
$ sudo pvesh get /nodes/{node_name}/qemu/{vm_id}/config | grep "size=" | awk '{print $2}'
```
Example:
```
$ sudo pvesh get /nodes/vh8/qemu/352/config | grep "size=" | awk '{print $2}'
sata0
```

---

## List all detached hard disks for a specific VM on the cluster
```
$ sudo pvesh get /nodes/{node_name}/qemu/{vm_id}/config | grep "unused" | awk '{print $2}'
```
Example:
```
$ sudo pvesh get /nodes/vh8/qemu/352/config | grep "unused" | awk '{print $2}'
unused0
```

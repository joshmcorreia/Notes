# Proxmox

### List all VMs
```
sudo qm list
```

### Get the next available vmid
```
$ sudo pvesh get /cluster/nextid
148
```

### List all images
```
ls /var/lib/vz/images
```

### View storage information
```
sudo cat /etc/pve/storage.cfg
```

### Verify image format
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

### Create a VM from a qcow2 image
```
$ sudo qm create 1000 -scsi0 local:0,import-from=/var/lib/vz/images/1000/test-vm.qcow2 --name qcow-test
Formatting '/var/lib/vz/images/1000/vm-1000-disk-0.raw', fmt=raw size=21484431360 preallocation=off
transferred 0.0 B of 20.0 GiB (0.00%)
...
transferred 20.0 GiB of 20.0 GiB (100.00%)
scsi0: successfully created disk 'local:1000/vm-1000-disk-0.raw,size=20980890K'
```

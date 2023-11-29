# Proxmox Storage

---

## View storage information
```
$ sudo cat /etc/pve/storage.cfg
```

---

## List storage contents
To get the storage_name see "View storage information" above
```
$ sudo pvesm list {storage_name}
```
Example:
```
$ sudo pvesm list ceph
Volid                                       Format  Type                Size VMID
ceph:vm-352-disk-0                          raw     images       21484431360 352
ceph:vm-352-disk-2                          raw     images       21484431360 352
```

---

## Move a disk from local storage to ceph storage
Note: The disk is NOT attached to the VM in Proxmox when you do this.
```
$ sudo qemu-img convert -f qcow2 -O raw {qcow2_file} rbd:{pool_name}/{desired_vm_disk_name}
```
Example:
```
$ sudo qemu-img convert -f qcow2 -O raw test-image.qcow2 rbd:rbd/vm-352-disk-2
```

---

## Overwrite a disk on ceph
This is kind of a clever hack to overwrite a disk on ceph without Proxmox knowing about it. When you boot up the Proxmox VM it will be as if you replaced the disk with the new disk.

1. Shut down the Proxmox VM
2. Remove the old disk
   ```
   $ sudo rbd -p rbd rm vm-352-disk-0
   Removing image: 100% complete...done.
   ```
   At this point, Proxmox does not know that the disk has been removed.
3. Import the new image in the same location as the old disk
   ```
   $ sudo qemu-img convert -f qcow2 -O raw test-image.qcow2 rbd:rbd/vm-352-disk-0
   ```

---

## List ceph storage
```
$ sudo rbd ls
vm-352-disk-0
vm-352-disk-2
```

---

## List rbd image information
```
$ sudo rbd info {rbd_image_name}
```
Example:
```
$ sudo rbd info vm-352-disk-2
rbd image 'vm-352-disk-2':
        size 20 GiB in 5123 objects
        order 22 (4 MiB objects)
        snapshot_count: 0
        id: 3603cb44ca9441
        block_name_prefix: rbd_data.3603cb44ca9441
        format: 2
        features: layering, exclusive-lock, object-map, fast-diff, deep-flatten
        op_features:
        flags:
        create_timestamp: Wed Nov 29 16:06:31 2023
        access_timestamp: Wed Nov 29 16:06:31 2023
        modify_timestamp: Wed Nov 29 16:06:31 2023
```

---

## Remove an rbd image
```
$ sudo rbd -p {pool_name} rm {rbd_image_name}
```
Example:
```
$ sudo rbd -p rbd rm vm-352-disk-0
Removing image: 100% complete...done.
```

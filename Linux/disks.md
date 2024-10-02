# Disks

## List block devices
Below is an example from Azure with a 32GB disk attached:
```
$ lsblk
NAME              MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                 8:0    0   64G  0 disk
├─sda1              8:1    0  500M  0 part /boot
├─sda2              8:2    0   63G  0 part
│ ├─rootvg-tmplv  253:0    0    2G  0 lvm  /tmp
│ ├─rootvg-usrlv  253:1    0   10G  0 lvm  /usr
│ ├─rootvg-homelv 253:2    0    1G  0 lvm  /home
│ ├─rootvg-varlv  253:3    0    8G  0 lvm  /var
│ └─rootvg-rootlv 253:4    0    2G  0 lvm  /
├─sda14             8:14   0    4M  0 part
└─sda15             8:15   0  495M  0 part /boot/efi
sdb                 8:16   0   88G  0 disk
└─sdb1              8:17   0   88G  0 part /mnt
sdc                 8:32   0   32G  0 disk
└─sdc1              8:33   0   32G  0 part
```

---

## Create a partition
[How to Add New Disk Drive to a Linux System](https://www.adamsdesk.com/posts/add-disk-drive-linux/)

Run fdisk and supply the block device:
```
$ sudo fdisk /dev/sdc
```
Set the disk label:
```
Command (m for help): g
Created a new GPT disklabel (GUID: B5AE0E99-122C-7146-9EEE-03ED6609D7A5).
```
Create the partition:
```
Command (m for help): n
Partition number (1-128, default 1):
First sector (2048-67108830, default 2048):
Last sector, +sectors or +size{K,M,G,T,P} (2048-67108830, default 67108830):

Created a new partition 1 of type 'Linux filesystem' and of size 32 GiB.
```
Set the partition type:
```
Command (m for help): t
Selected partition 1
Partition type (type L to list all types): 20
Changed type of partition 'Linux filesystem' to 'Linux filesystem'.
```
Verify the changes:
```
Command (m for help): p
Disk /dev/sdc: 32 GiB, 34359738368 bytes, 67108864 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: B5AE0E99-122C-7146-9EEE-03ED6609D7A5

Device     Start      End  Sectors Size Type
/dev/sdc1   2048 67108830 67106783  32G Linux filesystem
```
Save the changes:
```
Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

---

## Format the partition
```
$ sudo mkfs.ext4 -L new-volume-label /dev/sdc1
mke2fs 1.45.6 (20-Mar-2020)
Discarding device blocks: done
Creating filesystem with 8388347 4k blocks and 2097152 inodes
Filesystem UUID: a7d6b8e2-3f4a-4923-a94d-2c9cce382d14
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000, 7962624

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done
```

---

## Mount the drive
Create a directory for the mount point
```
$ sudo mkdir /disk1
```
Get the UUID of the disk drive
```
$ lsblk -f
NAME              FSTYPE      LABEL            UUID                                   MOUNTPOINT
sda
├─sda1            xfs                          30de0034-6c48-43e5-87d2-b7ff3b165dec   /boot
├─sda2            LVM2_member                  s33IBk-oLdt-yA3A-hLhV-RWAl-5fRT-Vq1nuG
│ ├─rootvg-tmplv  xfs                          6c7f91fe-7de7-42a8-9ab2-c2f8c3f7db96   /tmp
│ ├─rootvg-usrlv  xfs                          c787050b-6bf5-48b4-b618-aa2551e96ed8   /usr
│ ├─rootvg-homelv xfs                          f620124f-4e99-415b-8085-c1634274049a   /home
│ ├─rootvg-varlv  xfs                          713a1ae9-8087-4d95-a879-4d63d7544175   /var
│ └─rootvg-rootlv xfs                          ac504089-82ef-4d16-8690-e0442ef8958d   /
├─sda14
└─sda15           vfat                         7B77-590C                              /boot/efi
sdb
└─sdb1            ext4                         ab47d661-76cc-40cb-97d2-455d67e10cd3   /mnt
sdc
└─sdc1            ext4        new-volume-label a7d6b8e2-3f4a-4923-a94d-2c9cce382d14
```
The UUID we want is `a7d6b8e2-3f4a-4923-a94d-2c9cce382d14`

Open up `fstab`
```
$ sudo vim /etc/fstab
```
And add the following line:
```
UUID=a7d6b8e2-3f4a-4923-a94d-2c9cce382d14 /disk1 ext4   defaults,errors=remount-ro 0 2
```
Mount the disk drive
```
$ sudo mount -a
```
Verify that the drive has been mounted
```
$ lsblk
NAME              MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                 8:0    0   64G  0 disk
├─sda1              8:1    0  500M  0 part /boot
├─sda2              8:2    0   63G  0 part
│ ├─rootvg-tmplv  253:0    0    2G  0 lvm  /tmp
│ ├─rootvg-usrlv  253:1    0   10G  0 lvm  /usr
│ ├─rootvg-homelv 253:2    0    1G  0 lvm  /home
│ ├─rootvg-varlv  253:3    0    8G  0 lvm  /var
│ └─rootvg-rootlv 253:4    0    2G  0 lvm  /
├─sda14             8:14   0    4M  0 part
└─sda15             8:15   0  495M  0 part /boot/efi
sdb                 8:16   0   88G  0 disk
└─sdb1              8:17   0   88G  0 part /mnt
sdc                 8:32   0   32G  0 disk
└─sdc1              8:33   0   32G  0 part /disk1
```
Notice that the mountpoint for `sdc1` now says `/disk1`.

---

# Extending an LVM device

[Need help extending an LVM volume](https://askubuntu.com/questions/1489128/need-help-extending-an-lvm-volume)

Tested on Ubuntu 22.04

1. Check the current disk size:
    ```
    $ lsblk
    NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    loop0                       7:0    0 63.9M  1 loop /snap/core20/2318
    loop1                       7:1    0   64M  1 loop /snap/core20/2379
    loop2                       7:2    0   87M  1 loop /snap/lxd/28373
    loop3                       7:3    0   87M  1 loop /snap/lxd/29351
    loop4                       7:4    0 38.8M  1 loop /snap/snapd/21759
    loop5                       7:5    0 49.8M  1 loop /snap/snapd/18357
    sda                         8:0    0  100G  0 disk
    ├─sda1                      8:1    0    1M  0 part
    ├─sda2                      8:2    0    2G  0 part /boot
    └─sda3                      8:3    0   48G  0 part
      └─ubuntu--vg-ubuntu--lv 253:0    0   48G  0 lvm  /
    sr0                        11:0    1 1024M  0 rom
    ```
1. Extend the size of your drive in your hypervisor. For this example I added 50GB of storage, and you can see that sda3 now shows 98GB.
    ```
    $ lsblk
    NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    loop0                       7:0    0 63.9M  1 loop /snap/core20/2318
    loop1                       7:1    0   64M  1 loop /snap/core20/2379
    loop2                       7:2    0   87M  1 loop /snap/lxd/28373
    loop3                       7:3    0   87M  1 loop /snap/lxd/29351
    loop4                       7:4    0 38.8M  1 loop /snap/snapd/21759
    loop5                       7:5    0 49.8M  1 loop /snap/snapd/18357
    sda                         8:0    0  100G  0 disk
    ├─sda1                      8:1    0    1M  0 part
    ├─sda2                      8:2    0    2G  0 part /boot
    └─sda3                      8:3    0   98G  0 part
      └─ubuntu--vg-ubuntu--lv 253:0    0   48G  0 lvm  /
    sr0                        11:0    1 1024M  0 rom
    ```
1. Resize the partition
    ```
    $ sudo growpart /dev/sda 3
    ```
1. Resize the PV
    ```
    $ sudo pvresize /dev/sda3
    Physical volume "/dev/sda3" changed
    1 physical volume(s) resized or updated / 0 physical volume(s) not resized
    ```
1. Resize the logical volume:
    ```
    $ sudo lvresize -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
    Size of logical volume ubuntu-vg/ubuntu-lv changed from <48.00 GiB (12287 extents) to <98.00 GiB (25087 extents).
    Logical volume ubuntu-vg/ubuntu-lv successfully resized.
    ```
1. Resize the file system
    ```
    $ sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
    resize2fs 1.46.5 (30-Dec-2021)
    Filesystem at /dev/mapper/ubuntu--vg-ubuntu--lv is mounted on /; on-line resizing required
    old_desc_blocks = 6, new_desc_blocks = 13
    The filesystem on /dev/mapper/ubuntu--vg-ubuntu--lv is now 25689088 (4k) blocks long.
    ```
1. Verify that the filesystem sees the new size. In the example below you can see that it correctly says 98GB.
    ```
    $ lsblk
    NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
    loop0                       7:0    0 63.9M  1 loop /snap/core20/2318
    loop1                       7:1    0   64M  1 loop /snap/core20/2379
    loop2                       7:2    0   87M  1 loop /snap/lxd/28373
    loop3                       7:3    0   87M  1 loop /snap/lxd/29351
    loop4                       7:4    0 38.8M  1 loop /snap/snapd/21759
    loop5                       7:5    0 49.8M  1 loop /snap/snapd/18357
    sda                         8:0    0  100G  0 disk
    ├─sda1                      8:1    0    1M  0 part
    ├─sda2                      8:2    0    2G  0 part /boot
    └─sda3                      8:3    0   98G  0 part
      └─ubuntu--vg-ubuntu--lv 253:0    0   98G  0 lvm  /
    sr0                        11:0    1 1024M  0 rom
    ```

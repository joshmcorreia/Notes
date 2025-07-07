# parted

## Select a disk
```
$ sudo parted /dev/nvme0n1
```

## Print the partition table
```
(parted) p
```
Example:
```
(parted) p
Model: MSFT NVMe Accelerator v1.0 (nvme)
Disk /dev/nvme0n1: 137GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name                  Flags
 1      1049kB  211MB   210MB   fat16        EFI System Partition  boot, esp
 2      211MB   735MB   524MB   xfs
 3      735MB   736MB   1049kB                                     bios_grub
 4      736MB   68.7GB  68.0GB                                     lvm
```

## See free disk space
```
(parted) p free
```
Example:
```
(parted) p free
Model: MSFT NVMe Accelerator v1.0 (nvme)
Disk /dev/nvme0n1: 137GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name                  Flags
        17.4kB  1049kB  1031kB  Free Space
 1      1049kB  211MB   210MB   fat16        EFI System Partition  boot, esp
 2      211MB   735MB   524MB   xfs
 3      735MB   736MB   1049kB                                     bios_grub
 4      736MB   68.7GB  68.0GB                                     lvm
        68.7GB  137GB   68.7GB  Free Space
```

## Expand an existing partition with all remaining drive space
```
(parted) resizepart {PARTITION_NUMBER} 100%
```
Example:
```
(parted) resizepart 4 100%
(parted) p
Model: MSFT NVMe Accelerator v1.0 (nvme)
Disk /dev/nvme0n1: 137GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags:

Number  Start   End    Size    File system  Name                  Flags
 1      1049kB  211MB  210MB   fat16        EFI System Partition  boot, esp
 2      211MB   735MB  524MB   xfs
 3      735MB   736MB  1049kB                                     bios_grub
 4      736MB   137GB  137GB                                      lvm
```

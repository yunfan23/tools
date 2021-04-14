1. Yum Commands

[Yum Commands](yum_cheatsheet.pdf)

2. How to mount disk in Linux and automatically enable when reboot

```bash
fdisk -l                      # check disks available
df -h                         # check mounted disks
mkfs.ext4 /dev/vdb            # reset 
mount /dev/vdb /u01           # mount /u01
blkid                         # get uuid, use uuid to mount
vim /etc/fstab                # mount，template is UUID=********** /u01  ext4  defaults  1
```


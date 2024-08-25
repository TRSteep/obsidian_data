#debian #storage
- Disk + partition
	- `lsblk`
	- выводит сами диски, а так же разделы на диске и их размеры
```bash
NAME                    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sdb                     8:16   0 111.8G  0 disk
├─sdb2                  8:18   0    18G  0 part
├─sdb5                  8:21   0     4G  0 part /var/log
├─sdb3                  8:19   0   512M  0 part
├─sdb1                  8:17   0    18G  0 part /
└─sdb6                  8:22   0     1G  0 part [SWAP]
tda                     254:0    0    40G  0 disk
sda                     8:0    0 931.5G  0 disk
├─VG_XenStorage--b98953f5 253:1    0  40.1G  0 lvm
├─VG_XenStorage--b98953f5 253:2    0  40.1G  0 lvm
└─VG_XenStorage--b98953f5 253:0    0     4M  0 lvm
tdb                    254:1    0    40G  0 disk
```

- Mounted + usage
	- `df -h`
	- выводит разделы их объем и занятое место (здесь занят sdb1)
```bash
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        716M  8.0K  716M   1% /dev
tmpfs           727M  152K  727M   1% /dev/shm
tmpfs           727M  9.3M  718M   2% /run
tmpfs           727M     0  727M   0% /sys/fs/cgroup
/dev/sdb1        18G   18G     0 100% /
xenstore        727M     0  727M   0% /var/lib/xenstored
/dev/sdb5       3.9G   23M  3.6G   1% /var/log
tmpfs           146M     0  146M   0% /run/user/0

```

Перераспределение объема дисков
- GParted Live Disc
	- https://gparted.org/download.php
- growpart (без отмонтирования раздела)
	- 
- `sudo fdisk -l`
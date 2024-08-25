#hypervisor #software 

# Hardware
- 64bit CPU
- USB stick 2Gb
- RAM: 2 GB RAM, plus additional RAM needed for guests 

# Download
- https://www.proxmox.com/en/downloads/proxmox-virtual-environment

# Install
-  ISO to flash
	- Rufus https://rufus.ie/en/
	- balenaEtcher https://etcher.balena.io/
	- ventoy not supported
- Write ISO on Flash
- Boot from Flash
- Hard Drive
	- Файловая система
		- для ОСи лучше ext4 (ZFS для RAID0 - зеркало )
		- для хранилища ZFS
	- Options
		- hdsize
			- Defines the total hard disk size to be used
			- reserve free space on the hard disk for further partitioning
		- swapsize (8GB)
			- Defines the size of the swap volume
			- The default is the size of the installed memory
			- minimum 4 GB and maximum 8 GB
			- The resulting value cannot be greater than hdsize/8
		- maxroot (32GB for 128GB)
			- Defines the maximum size of the root volume
			- stores the operation system
			- The maximum limit of the root volume size is hdsize/4
		- maxvz
			- Defines the maximum size of the data volume
			- datasize = hdsize - rootsize - swapsize - minfree
		- minfree (16GB for 128GB)
			- Defines the amount of free space that should be left in the LVM volume group pve
			- the default is 16GB, otherwise hdsize/8 will be used
- Сеть
	- выбрать нужную карточку (активная выделена зеленым)
	- IP можно получать по DHCP или задать

# Connect
- https://<адрес_сервера>:8006

# Configure
## Repo
### GUI
- Updates > Repositories
- Highlight the enterprise repos and click the Disable button
- ![|500](Disable-Enterprise-from-GUI.webp)
- click Add
- Add the No-Subscription repo and then either the Ceph Quincy or Ceph Reef no-subscription repo
- ![|400](Add-no-subscription-repos-from-GUI.webp)
- ![|500](No-subscription-repos-enabled.webp)

### CLI
- `nano /etc/apt/sources.list.d/pve-enterprise.list`
```python
From: deb https://enterprise.proxmox.com/debian/pve bookworm enterprise
To: deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription
```
- `nano /etc/apt/sources.list.d/ceph.list`
```python
#For Ceph Quincy
From: deb https://enterprise.proxmox.com/debian/ceph-quincy bookworm enterprise
To: deb http://download.proxmox.com/debian/ceph-quincy bookworm no-subscription

#For Ceph Reef
From: deb https://enterprise.proxmox.com/debian/ceph-reef bookworm enterprise
To: deb http://download.proxmox.com/debian/ceph-reef bookworm no-subscription
```
- check
```python
nano /etc/apt/sources.list
nano /etc/apt/sources.list.d/pve-enterprise.list
```

## Update
- `apt dist-upgrade`

## Storage
### Add HDD
- Создаем раздел на новом диске
	- `lsblk`
		- list the available drives
	- `cfdisk /dev/sdb`
		- New -> (Выбираем объем раздела)
		- Primary - Выбираем тип раздела
		- Write -> "yes" - Сохраняем настройки
		- Quit
	- Форматируем новый раздел в формат "ext4"
		- `mkfs.ext4 /dev/sdb1`
	- EXT4
		- Чтобы подключить диск, создадим новую папку (можно задать любое имя папки и точку монтирования, например MM1TB
			- `mkdir /var/lib/MM1TB`
		- Монтируем диск в новую папку
			- `mount -t ext4 /dev/sdb1 /var/lib/MM1TB/`
		- Добавляем новый диск в fstab, чтобы он автоматически монтировался после перезагрузки компьютера
			- `nano /etc/fstab`
		- Добавляем следующую строку в ваш файл fstab
			- `/dev/sdb1 /var/lib/MM1TB/ ext4 defaults,errors=remount-ro 0 1`
		- Подключаемся к гипервизору через web-интерфейс
			- Чтобы добавить новую директорию, проходим по пути
			- Datacenter > Storage > Add > Directory
				- "ID" - имя хранилища
				- "Directory" - путь к новой папке
				- "Content" - что будет храниться на новом диске
					- Disk Image
					- Container
					- ISO Image - если будем хранить ISO
	- LVM (LVM-thin)
		- Создаем том, следующей командой
			- `pvcreate /dev/sdb1`
		- Создаем группу тома (мы выбрали название "newdrive")
			- `vgcreate newdrive /dev/sdb1`
		- Теперь добавляем LVM в Proxmox
			- Datacenter > Storage > Add > LVM
				- "ID" - имя хранилища
				- "Volume Group" - выбираем "newdrive" (группа тома)
				- "Content" - что будет храниться на новом диске
		- В итоге получаем хранилище LVM
- Administration - Storage / Disks
	- Use ZFS
### ISO Storage
- Web interface
	- Datacenter > Storage
	- Для нужного хранилища разрешить ISO
		- Выбрать нужное хранилище
		- Edit
			- Content
				- ISO image
	- Выбрать хранилище нужной ноды
		- ISO Images
			- Upload

# Create a VM

## Errors
```python
kvm: warning: host doesn't support requested feature: CPUID.01H:ECX.aes [bit 25]
kvm: Host doesn't support requested features
TASK ERROR: start failed: QEMU exited with code 1
```
- Change CPU with no AES for Example:
	- x86-64-v2

# Security
## fail2ban (NOT worked)
- https://pve.proxmox.com/wiki/Fail2ban
- `apt install fail2ban`
- `cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local`
- `nano /etc/fail2ban/jail.local`
```ini
[DEFAULT]
backend = systemd
bantime  = 1d
maxretry = 5
findtime  = 1h

[sshd]
enabled = true
```

### Base Config
- `nano /etc/fail2ban/jail.local`
```ini
[proxmox]
enabled = true
port = https,http,8006
filter = proxmox
backend = systemd
maxretry = 3
findtime = 2d
bantime = 1h
```

### Filter Config
-  `nano /etc/fail2ban/filter.d/proxmox.conf`
```ini
[Definition]
failregex = pvedaemon\[.*authentication failure; rhost=<HOST> user=.* msg=.*
ignoreregex =
journalmatch = _SYSTEMD_UNIT=pvedaemon.service
```

- Restart Service to Enable Config
	- `systemctl restart fail2ban`

## Test fail2ban Config
- `fail2ban-regex systemd-journal /etc/fail2ban/filter.d/proxmox.conf`
- `fail2ban-client -v status sshd`
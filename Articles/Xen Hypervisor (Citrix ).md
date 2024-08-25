#virtual #hypervisor #os #iso #xen 
### Info
- https://habr.com/ru/articles/599213/
- https://ittraveler.org/ustanovka-i-nastrojka-citrix-xenserver-chast-1/
- https://docs.xenserver.com/en-us/xenserver/8/

## Download
-  https://www.xenserver.com/downloads#download
	- XenServer 8 Preview installation ISO
		- XenServer VM Tools for Linux 8.3.0-1
		- XenServer VM Tools for Windows 9.3.1
	- XenCenter 2023.3.1

## Install
- Write ISO to flash with Rufus

---
### Install Guest systems
### ISO
- ISO image storage
- `mkdir /var/opt/ISO`
- `xe sr-create name-label=ISO_IMAGES_LOCAL type=iso device-config:location=/var/opt/ISO device-config:legacy_mode=true content-type=iso`
- `xe sr-list`
- WinSCP
	- /var/opt/ISO
	- скопировать ISO файл
- OR download
	- `wget https://*address*/*file*.iso`
- Update storage
	- XenCenter > ISO_IMAGES_LOCAL > Rescan
- Guest Tools
	- Linux
		- APT (xe-guest-utilities)
			- `sudo apt install xe-guest-utilities`
		- TAR
			- `tar xvzf LinuxGuestTools-8.3.0-1.tar.gz`
			- `sudo ./install.sh`
			- If error version - install manually
				- `sudo ./install.sh -d debian -m 21`
				- `sudo shutdown -r now`

---
## Work
- VM
	- Список виртуальных машин (поиск UID)
		- `xe vm-list`
		- `xe vm-list is-control-domain=false is-a-snapshot=false`
	- Автогрузка машин
		- `xe vm-param-set uuid=UID other-config:auto_poweron=true`
	- Snapshot
		- `xe vm-snapshot uuid=UID new-name-label=testvmsnapshot` 
	- BackUp
		- Получаем uuid snapshot
			- `xe template-param-set is-a-template=false ha-always-run=false uuid=UIDshot`
		- VM to file
			- `xe vm-export vm=UID filename=vm-backup.xva`
		- snapshot to file
			- `xe template-param-set is-a-template=false ha-always-run=false uuid=UIDsnap`
		- Удалить snapshot
			- `xe vm-uninstall uuid=UIDsnap force=true`
- Host
	- BackUp
		- `xe host-backup file-name=filename -h hostname -u root -pw password`
	- Restore
		- `xe host-restore file-name=filename -h hostname -u root -pw password
 `

---
# Скрипты

Backup
- https://habr.com/ru/articles/317356/
- https://tecadmin.net/backup-running-virtual-machine-in-xenserver/
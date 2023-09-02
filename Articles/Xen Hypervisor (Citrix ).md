#virtual #hypervisor #os #iso
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
- Список виртуальных машин (поиск UID)
	- `xe vm-list`
- Автогрузка машин
	- `xe vm-param-set uuid=UID other-config:auto_poweron=true`
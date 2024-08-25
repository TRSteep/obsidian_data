#xen #hypervisor 

Install
- https://xcp-ng.org/
- https://xenproject.org/downloads/
- XEN-NG admin
	- https://github.com/xcp-ng/xenadmin/releases
- Docs
	- https://xcp-ng.org/docs/
	- https://xcp-ng.org/forum/
	- https://docs.xcp-ng.org/
---
# ISO
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

## Guest Tools
- Linux
	- **ISO**
		- `mount /dev/cdrom /mnt`
		- `bash /mnt/Linux/install.sh`
			- `cd /mnt/Linux/`
			- `sudo ./install.sh -d debian -m 11`
		- `umount /dev/cdrom`
		- `shutdown -r now`
	- APT (xe-guest-utilities)
		- `sudo apt install xe-guest-utilities`
	- DEB
		- CD
			- `mount /dev/cdrom /mnt`
			- `cd /mnt/Linux/`
			- `sudo dpkg -i "package_name.deb"`
		- Internet
			- `cd /tmp`
			- https://github.com/xenserver/xe-guest-utilities/releases
				- `wget https://github.com/xenserver/xe-guest-utilities/releases/download/v8.3.1/xe-guest-utilities_8.3.1-1_amd64.deb`
			- `sudo dpkg -i xe-guest-utilities_8.3.1-1_amd64.deb`
	- TAR
		- `cd /tmp`
		- `tar xvzf LinuxGuestTools-8.3.0-1.tar.gz`
		- `sudo ./install.sh`
		- If error version - install manually
			- `sudo ./install.sh -d debian -m 11`
			- `sudo shutdown -r now`
- Windows
	- https://github.com/xcp-ng/win-pv-drivers/releases
	- Citrix tools
		- testing by Citrix QA team
	- XCP-ng tools
		- Fully open-source

# Control
- XCP-ng Center
- Xen Orchestra
- VNC client
	- https://xcp-ng.org/docs/guests.html#all-vms

## Add HDD
- https://www.youtube.com/watch?v=rlPpNq2GMsc
- `fdisk -l`
	- Disk /dev/sda: 1000.2 GB
	- Disk /dev/sdb: 2000.4 GB
	- Disk /dev/sdc: 120.0 GB
- `xe host-list`
	- copy uuid
- `xe sr-create content-type=user device-config:device=/dev/sdb host-uuid=999d193a-286c-4a46-a6f7-fa16d0bd59fb name-label="Local 2TB" shared=false type=ext`

# Migrate 
## From VirtualBox
- Export your VM in OVA format
- use Xen Orchestra to import it
	- If you have an issue on VM boot try installing some xen drivers before exporting
		- dracut --add-drivers "xen-blkfront xen-netfront" --force
## From VHD
- Create a VM with the appropriate template, without any disk in it
- Attach the previously imported disk (VM/Disk/Attach an existing disk)
- Boot the VM

# VideoCard
- Nvidia
	- XCP-ng doesn't have (yet) support for NVIDIA vGPUs
- Radeon
	- https://www.amd.com/en/support/professional-graphics/firepro/firepro-s-series/firepro-s7150-x2
		- Citrix XenServer
			- Host Driver for MxGPU
				- mxgpu-2.0.0.amd.iso
			- Guest Driver for MxGPU
	- https://xcp-ng.org/docs/compute.html#gpu-passthrough
	- forum
		- https://xcp-ng.org/forum/topic/5932/vgpu-amd-mxgpu-iso-nowhere-to-find/8
	- Install
		- copy mxgpu-2.0.0.amd.iso
		- cd /tmp
		- xe-install-supplemental-pack mxgpu-2.0.0.amd.iso
		- Reboot the XCP-ng

# Troubles
- use Xen Orchestra
	- XOA click on the VM and then go to Advanced
		- enable Nested virtualization(not sure if actually needed) and VGA
- created a VM based on Red Hat 7
	- for Android 9


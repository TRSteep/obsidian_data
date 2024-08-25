<<<<<<< HEAD
#virtual #hypervisor #vmware #citrix #xen #kvm #list
=======
#virtual #hypervisor #vmware #citrix #xen #kvm
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
- ### VMware
    - VMware ESXi (vSphere Hypervisor)
        - https://customerconnect.vmware.com/en/evalcenter?p=free-esxi7
        - https://customerconnect.vmware.com/en/evalcenter?p=free-esxi8
    - Fault Tolerance
    - Флагман отрасли
- ## Citrix Xen
    - XCP-ng
        - https://xcp-ng.org/
    - XenServer Open source (Citrix Hypervisor)
        - https://www.xenserver.com/downloads
        - open-source versions: community, standard, and enterprise
    - Xen Project
        - https://xenproject.org/xen-project-archives/
<<<<<<< HEAD
        - https://github.com/xcp-ng/xenadmin/releases
=======
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
        - open-source software platform or Linux hypervisor. It supports virtualization for x86, x86_64, IA64, ARM, and other CPU architectures
        - guest operating systems such as Windows, Linux, BSD, and its other versions
    - Проброс топовых GPU внутрь гостя GPU Pass-through
    - vGPU Live Migration
    - виртуализация приложений (Citrix Virtual Apps and Desktops)
    - занял нишу виртуализации с активным использованием 3D
- ### Red Hat KVM
    - Недорогой и лояльный к аппаратным ресурсам KVM
    - ### Proxmox Virtual Environment
<<<<<<< HEAD
        - https://www.proxmox.com/en/downloads
=======
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
        - был разработан для управления KVM
- ### Linux KVM
	- only linux
		- https://www.linux-kvm.org/page/Main_Page
	- Debian
		- https://wiki.dieg.info/kvm
		- Проверка виртуализации
			- `egrep '(vmx|svm)' /proc/cpuinfo`
			- `sudo apt install cpu-checker`
				- `sudo kvm-ok`
		- Установка гипервизора
			- `sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager`
			- Пользователя в админы виртуалок
				- `sudo gpasswd -a $USER libvirt`
	- CentOS 7 (QEMU-KVM)
		- https://bozza.ru/art-260.html
		- Проверка виртуализации 
			- `egrep '(vmx|svm)' /proc/cpuinfo`
		- Установка
			- `yum install qemu-kvm libvirt libvirt-python libguestfs-tools virt-install`
			- `systemctl enable libvirtd && systemctl start libvirtd`
- ### Hyper-V
    - в составе MS Windows Server 2008
    - Hyper-V не умеет «на лету» добавлять CPU
    - тесная интеграция с экосистемой MS Windows
- Oracle VM Server for x86
	- cann't find ISO
	- uses open-source Xen hypervisor technology
- ### Parallels
- ### gnome-boxes
- ## Proxmox
	- https://www.proxmox.com/en/downloads/proxmox-virtual-environment
	- two virtualization technologies: KVM (Kernel-based Virtual Machine) hypervisor and Linux container (LXC) to provide enterprise-class virtualization
	- Proxmox VE is based on Debian GNU/Linux
	- Windows 10 client
		- https://pve.proxmox.com/wiki/Windows_10_guest_best_practices
- oVirt
	- https://www.ovirt.org/download/
	- open-source distributed virtualization solution developed for Linux operating systems such as RedHat Enterprise, CentOS, Scientific Linux, Fedora 28
- QEMU
	- https://www.qemu.org/download/
	- Openvz
		- https://download.openvz.org/virtuozzo/releases/7.0/x86_64/iso/
- SmartOS
	- https://wiki.smartos.org/display/DOC/Download+SmartOS
	- open-source SVR4 hypervisor based on the UNIX operating system that combines OpenSolaris technology with Linux’s KVM virtualization
- Virtuozzo
	- https://www.virtuozzo.com/
- Nutanix Hyperconverged Infrastructure
	- https://www.nutanix.com/products
- Hyper-V
- Red Hat Enterprise Virtualization (RHEV)
	- https://www.redhat.com/en/technologies/virtualization/enterprise-virtualization
- IBM PowerVM
	- 
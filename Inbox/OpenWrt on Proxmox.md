#software #virtual #proxmox #router 

# Info
- https://computingforgeeks.com/install-and-configure-openwrt-vm-on-proxmox-ve/

# Prepare
## OpenWRT Image
- Get the latest release tag
	- image file for x86_64
	- `VER=$(curl --silent "https://api.github.com/repos/openwrt/openwrt/releases/latest"|grep '"tag_name"'|sed -E 's/.*"([^"]+)".*/\1/'|sed 's/v//')`
- Download the latest OpenWRT image file into your Proxmox server path
	- `wget -O openwrt.img.gz https://downloads.openwrt.org/releases/$VER/targets/x86/64/openwrt-$VER-x86-64-generic-ext4-combined.img.gz`
- Extract downloaded archive to get raw image file
	- `gunzip ./openwrt.img.gz`
- Let’s increase the size of the raw disk to 5GB
	- `qemu-img resize -f raw ./openwrt.img 5G`

## Create OpenWrt Virtual Machine on Proxmox VE
set required variables for Virtual Machine creation
```ini
VM_NAME=OpenWrt
VM_ID=$(pvesh get /cluster/nextid)
RAM=2048
CORES=1
BRIDGE=vmbr0
IMAGE=./openwrt.img
```

create the Virtual Machine using qm command line tool
```bash
qm create --name $VM_NAME \
  $VM_ID --memory $RAM \
  --cores $CORES --cpu cputype=kvm64 \
  --net0 virtio,bridge=$BRIDGE \
  --scsihw virtio-scsi-pci --numa 1
```

list available storage domains
- `pvesm status`

Set storage value in STORAGE variable
- `STORAGE=local`

import the image into VM’s disk
- `qm importdisk $VM_ID $IMAGE $STORAGE`

attache disk to the Virtual machine
- `qm set $VM_ID --scsihw virtio-scsi-pci --virtio0 $STORAGE:$VM_ID/vm-$VM_ID-disk-0.raw`

Set serial console and Boot order priority.
```bash
qm set $VM_ID --serial0 socket --vga serial0
qm set $VM_ID --boot c --bootdisk virtio0
```

Configure the instance to start on system boot.
- `qm set $VM_ID --onboot 1`

## Access OpenWrt Virtual Machine console
Once started it will drop into the shell
Set new root password using passwd command.
- `passwd`

list current network information run
- `uci show network`\

set static IP information in the Virtual Machine edit the network configurations file.
- `nano /etc/config/dhcp`
- Restart network service
	- `service network restart`
	- or `/etc/init.d/network restart`
- update system package index
	- `opkg update`
- install a package use
	- `pkg install <package-name>`

## Access OpenWrt Web interface
Launch your web browser and input OpenWrt IP address
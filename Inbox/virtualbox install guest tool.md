#virtual #virtualbox #drive

- Insert CD
	- VBoxGuestAdditions.iso
- Mount CD into folder
	- `sudo mkdir -p /mnt/cdrom`
	- `sudo mount /dev/cdrom /mnt/cdrom`
- Install Guest Additions Tools
	- `cd /mnt/cdrom`
	- `sh ./VBoxLinuxAdditions.run`
#hardware #software #storage 

# File Systems
## Info
- https://gparted.org/features.php

## List

|           | &nbsp;Windows | Linux | Mac  | Android | File Size | Part Size |
| :-------- | :-----------: | :---: | :--: | :-----: | :-------: | --------- |
| NTFS      |      Yes      |  Yes  | Read |         |           | 16EB      |
| FAT32     |      Yes      |  Yes  | Yes  |         |   4 Гб    | 8 Тб      |
| **exFAT** |      Yes      | ExFat |  No  |         |           | 64 ZB     |
| HFS+      |      No       |  Yes  | Yes  |         |           | 8 EB      |
| EXT2, 3   |      No       |  Yes  |  No  |         |   16 Гб   | 32 Тб     |
| Udf       |               |       |      |         |           |           |
| Btrfs     |   WinBtrfs    |       |      |         |           |           |

## ext4
### Read ext4 on Windows
- Windows Subsystem for Linux (WSL)
	- Info
		- https://www.maketecheasier.com/install-linux-on-windows-10/
		- Windows features on
			- PowerShell
			- Windows Subsystem for Linux
		- `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
- Paragon ExtFS for Windows
	- ПО повреждает вам раздел с линуксом
- DiskGenius 70$
	- Open Ext4 in app like the Window File Explorer
- Ext2Fsd
	- https://www.ext2fsd.com/
	- https://sourceforge.net/projects/ext2fsd/files/latest/download
- Ext2Read 
	- https://sourceforge.net/projects/ext2read/

## exFAT
-  раздел с exfat невозможно ни растянуть, ни сжать


## Btrfs
- WinBtrfs
	- https://github.com/maharmstone/btrfs
	- Windows driver for the next-generation Linux filesystem
	- Features
		- Reading and writing of Btrfs filesystems
		- Basic RAID: RAID0, RAID1, and RAID10
		- Advanced RAID: RAID5 and RAID6
	- Install
		- https://github.com/maharmstone/btrfs/releases
		- right-click btrfs.inf, and choose Install
		- Chocolatey
			- `choco install winbtrfs`
	- Uninstall
		- `RUNDLL32.EXE SETUPAPI.DLL,InstallHinfSection DefaultUninstall 132 btrfs.inf`
- Ntfs2btrfs
	- https://github.com/maharmstone/ntfs2btrfs
	- conversion of Microsoft's NTFS filesystem to the open-source filesystem Btrfs
	- Install
		- https://github.com/maharmstone/ntfs2btrfs/releases
#debian #nix #config

# Hostname
- `nano /etc/hostname`
	- HOSTNAME
	- 127.0.0.1 localhost HOSTNAME

# Update
- [Debian. Source list](Debian.%20Source%20list.md)
	- `nano /etc/apt/sources.list`
	- comment `#deb cdrom`
- `apt update && apt upgrade`

# Sudo
- `su root`
- `apt install sudo`
- ### Add user
	- `adduser USER`
- Добавляем пользователя в группу sudo
	- `sudo usermod -aG sudo USER`
-  Нужно ли?
	- `nano /etc/sudoers`
	- add
		- `USER ALL=(ALL:ALL) ALL`

# Network
- Show interfaces
	- `ip a`
- [Debian. Network](Debian.%20Network.md)

# SSH
- [Debian SSH connection setup (+ssh key)](Debian%20SSH%20connection%20setup%20(+ssh%20key).md)

# Remote (VNC)
- [Linux Remote VNC](Inbox/Linux%20Remote%20VNC.md)

# Security
## Firewall
- [Debian Firewals](Debian%20Firewals.md)
## Anti DDoS
- 
#linux #debian
IP:
- ip a
- ifconfig

VNC
- Linux
	- `sudo apt update`
	- `sudo apt install tightvncserver`
	- `sudo tightvncserver`
- Client
	- https://www.tightvnc.com/download.html
	- IP:1

RDP
- Linux
	- `sudo apt install xrdp`

SSH
- Linux
	- SSH server
		- `sudo apt-get install openssh-server`
		- `sudo systemctl enable ssh --now`
- Windows
	- Putty SSH
		- https://putty.org/
	- PowerShell
		- ssh IP
		- ssh USER@IP
	- WinSCP
		- https://winscp.net/eng/download.php
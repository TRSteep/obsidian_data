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
<<<<<<< HEAD
	- xRDP
		- Поднимаете RDP-сервер под Linux с десятком X-сессий
		- `sudo apt install xrdp`
	- clients
		- Remmina
=======
	- `sudo apt install xrdp`
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7

SSH
- Linux
	- SSH server
		- `sudo apt-get install openssh-server`
		- `sudo systemctl enable ssh --now`
<<<<<<< HEAD
	- x2go (запускать интерфейсы на локальной машине, а ПО удаленно)
		- Server (работает с xfce4)
			- `sudo apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E`
			- `echo 'deb http://packages.x2go.org/debian testing main' | sudo tee /etc/apt/sources.list.d/x2go.list`
			- `sudo apt-get update`
			- `sudo apt-get install x2goserver x2goserver-xsession`
		- Client
			- http://code.x2go.org/releases/X2GoClient_latest_mswin32-setup.exe
- Windows
	- Putty SSH
		- https://putty.org/
		- `putty -ssh -l `
	- PowerShell
		- ssh IP
		- ssh USER@IP
		- `ssh user@wonderland.local/system@10.10.0.50 -p 2200`
=======
- Windows
	- Putty SSH
		- https://putty.org/
	- PowerShell
		- ssh IP
		- ssh USER@IP
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
	- WinSCP
		- https://winscp.net/eng/download.php
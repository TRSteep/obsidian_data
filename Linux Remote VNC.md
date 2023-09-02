# tightvncserver
## Install
- `sudo apt install -y tightvncserver`
## Run
- `vncserver`
- Select password 8 symbols
- view-only password - n

## Configure
- First Config
	- остановить работающий дисплей
		- `vncserver -kill :1`
	- конфигурационный файл, отвечающий за запуск графической оболочки
		- `rm -f ~/.vnc/xstartup`
		- `nano ~/.vnc/xstartup`
``` bash
~/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
```
- сделать созданный файл исполняемым
	- `chmod +x ~/.vnc/xstartup`
- `vncserver`
- Автозапуск 
	- https://eternalhost.net/base/vps-vds/vnc-linux-ustanovka
- Configure VNC as a service
	- `cd /etc/systemd/system`
	- `nano vncserver@.service`
```
[Unit]
Description=Remote desktop service (VNC)
After=syslog.target network.target
[Service]
Type=forking
User=edward
PIDFile=/home/edward/.vnc/%H:%i.pid
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x800 :%i
ExecStop=/usr/bin/vncserver -kill :%i
[Install]
WantedBy=multi-user.target
```
- `systemctl daemon-reload`
- `systemctl start vncserver@1.service`
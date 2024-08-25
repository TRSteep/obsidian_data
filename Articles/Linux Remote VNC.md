#debian #remote
# Tightdvncserver
Info
- https://timeweb.cloud/tutorials/debian/kak-ustanovit-i-nastroit-vnc-v-debian-10
- https://eternalhost.net/base/vps-vds/vnc-linux-ustanovka

## Install
- `sudo apt install -y tightvncserver`
- `sudo apt install xfce4 xfce4-goodies`
- `sudo apt install dbus-x11`
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
	- `sudo nano /usr/local/bin/myvnc`
```bash
#!/bin/bash
PATH="$PATH:/usr/bin/"
DISPLAY="1"
DEPTH="16"
GEOMETRY="1024x768"
OPTIONS="-depth ${DEPTH} -geometry ${GEOMETRY} :${DISPLAY}"
case "$1" in
start)
/usr/bin/vncserver ${OPTIONS}
;;
stop)
/usr/bin/vncserver -kill :${DISPLAY}
;;
restart)
$0 stop
$0 start
;;
esac
exit 0
```
- `sudo chmod +x /usr/local/bin/myvnc`
- `myvnc start`
- `sudo nano /lib/systemd/system/myvnc.service`
```bash
[Unit]
Description=MyVnc
[Service]
Type=forking
ExecStart=/usr/local/bin/myvnc start
ExecStop=/usr/local/bin/myvnc stop
ExecReload=/usr/local/bin/myvnc restart
User=username
[Install]
WantedBy=multi-user.target
```
- В переменную «User» вводится логин пользователя Linux, от имени которого будет запускаться VNC-сервер
- `sudo systemctl enable myvnc.service`
- `sudo systemctl daemon-reload`
- `myvnc restart`

Подключаться через mremote-ng
- порт 5901

---
# UltraVNC
- `apt-get install vncviewer`

---
# Vino VNC (gnome)

---
# x11vnc
- https://hackware.ru/?p=12588
- https://avg-it.ru/info/articles/nastroyka-udalyennogo-dostupa-do-kompyutera-s-linux-ubuntu-debian-mint-xubuntu-elementary-os/
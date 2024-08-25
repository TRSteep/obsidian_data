#vpn #shadowsocs #vless #vmess #debian #v2ray
- ### Info
	- Marzban GIT https://github.com/Gozargah/Marzban
- ### Install
	- https://openode.ru/topic/525-ustanavlivaem-marzban-kak-prostaya-zamena-wireguard-bystryy-gayd/
	- https://github.com/Gozargah/Marzban#installation-guide
	- Update
		- ``apt update && apt upgrade``
		- `apt install sudo`
		- `apt install curl`
	- AUTO Install
		- `sudo bash -c "$(curl -sL https://github.com/Gozargah/Marzban-scripts/raw/master/marzban.sh)" @ install`
	- Создаем пользователя web админа
		- `marzban cli admin create --sudo`
	- Безопасность
		- Firewall
			- `apt-get install ufw`
			- `ufw allow from 192.168.2.0/24 to any port 22 proto tcp`
			- `ufw allow 8000 comment 'Web interface'`
			- `ufw allow 8081/tcp comment 'VMess'`
			- `ufw allow 8080 comment 'VMess'`
			- `ufw allow 8443/tcp comment 'VLESS'`
			- `ufw allow 2053 comment 'VLESS'`
			- `ufw allow 1080 comment 'Shadowsocs'`
			- `ufw enable`
- ### Config
	- Идем в панель: 
		- `ip a`
		- IP:8000/dashboard/
		- Создаем пользователя: Create new user и выбираем протоколы
		- Далее скидываем ссылку или QR код
		- Ссылки и QR
			- Подписка
			- VMESS
			- VLESS
			- ShadowsSocks
- ### Clients
	- [V2Ray Clients](V2Ray%20Clients.md)

`

---
TG bot
- telebot
	- https://github.com/mmdchnar/marzban-telebot
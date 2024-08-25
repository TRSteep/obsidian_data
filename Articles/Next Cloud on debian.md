#debian 
- Install
	- `sudo apt update`
	- `sudo apt install snapd`
	- `sudo snap install core`
	- `sudo snap install nextcloud`
- Open web page on server IP
	- Enter admin user + password
- Config server
	- Firewall
		- `apt install ufw`
		- `sudo ufw allow 80,443/tcp`
	- Let's Encrypt
		- Подписание для внешнего домена
			- `sudo nextcloud.enable-https lets-encrypt`
				- y
				- EMAIL
				- DOMAIN
		- Собственный сертификат
			- `sudo nextcloud.enable-https self-signed`
		- 
- Config NextCloud

Config file
`sudo find / -name "config.php" 2>/dev/null`
```bash
/var/snap/nextcloud/37720/nextcloud/config/config.php
/var/snap/nextcloud/37045/nextcloud/config/config.php
/snap/nextcloud/37720/htdocs/config/config.php
/snap/nextcloud/37045/htdocs/config/config.php
```

- `sudo nano /var/snap/nextcloud/37045/nextcloud/config/config.php`
- `sudo nano /var/snap/nextcloud/37720/nextcloud/config/config.php`
	- trusted_domains
	- overwrite.cli.url
#security #linux #debian 

# Work
## Check
- `fail2ban-client -v status sshd`

# Install
- `apt update`
- `apt install fail2ban`
## Config
- `nano /etc/fail2ban/jail.conf`
- Изменяем переменные
	- **bantime**
		- количество секунд на которые будет блокироваться злоумышленник
	- **maxretry**
		- количество попыток ввода логина/пароля
- Сохраняем файл 
- Перезапускаем службу после изменения
	- `systemctl restart fail2ban`
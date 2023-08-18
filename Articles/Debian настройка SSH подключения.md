#SSH #debian 
## Информация
- https://serverspace.ru/support/help/generaciya-ssh-kluchey/
	- //serveroid.com/ru/kb/how-to-add-public-key.html
- https://wiki.diphost.ru/PuttyConfigKeys
- https://www.8host.com/blog/kak-nastroit-ssh-klyuchi-v-debian-11/
- https://help.reg.ru/support/servery-vps/oblachnyye-servery/rabota-s-serverom/kak-ustanovit-i-nastroit-ssh-server-na-debian
- https://www.nic.ru/help/kak-ustanovit6-i-nastroit6-ssh-server-na-debian_11418.html
- https://losst.pro/avtorizatsiya-po-klyuchu-ssh

## Установка
- `apt update && apt upgrade`
- `sudo apt install openssh-server`
- `sudo reboot`
- Просмотр состояния
	- `sudo systemctl status ssh`

## Настройка подключения по паролю
- Конфигурация
	- `sudo nano /etc/ssh/sshd_config`
- Клиент
	- `ssh [User]@[IP]`
	- `ssh [User]@[IP] -p 22`

## Настройка безопасности
- Бекап
	- `sudo cp /etc/ssh/sshd_config{,_back}`
- Firewall
	- `sudo ufw allow ssh`
- `sudo nano /etc/ssh/sshd_config`
	- Смена штатного порта
		- `Port 34226`
		- ctrl+x, Y
		- Firewall change port
			- `sudo ufw delete allow http`
			- `sudo ufw allow 34226
	- Логин под root
		- Разрешен
			- `PermitRootLogin yes`
		- Запрещен
			- `PermitRootLogin no
		- Только по SSH ключам
			- `PermitRootLogin prohibit-password`
- `sudo systemctl restart ssh`

## Настройка подключения по SSH ключам
- `sudo nano /etc/ssh/sshd_config`
	- `PasswordAuthentication no`
		- `ChallengeResponseAuthentication no`
		- `UsePAM no`
	- `sudo systemctl restart ssh`
	- 
### Клиент Windows
http://www.chiark.greenend.org.uk/%7Esgtatham/putty/download.html
- запустить PuTTYgen и нажать кнопку «Generate»
	- Для ускорения генерации необходимо хаотично передвигать курсор мыши.
- Сохранение публичного ключа
	- ![[3--1-.png|300]]
	- **WinSCP**
	-  Подключится к серверу по SSH
	- Загрузить SSH ключ
- Сохранение приватного ключа
	- ![[4.png|300]]
- Добавление приватного ключа в PuTTY
	- Connection -> SSH -> Auth
		- Путь к секретному файлу с SSH ключом
	- ![[6.png|300]]

### Клиент linux


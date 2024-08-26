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
<<<<<<< HEAD
- `sudo systemctl start ssh`
	- or `sudo reboot`
=======
- `sudo reboot`
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
- Просмотр состояния
	- `sudo systemctl status ssh`

## Настройка подключения по паролю
- Конфигурация
	- `sudo nano /etc/ssh/sshd_config`
<<<<<<< HEAD
	- `sudo systemctl restart ssh`
=======
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
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
<<<<<<< HEAD
	- Создание отдельного пользователя для ssh
		- `adduser USER`
		- `usermod -aG sudo USER`
		- `nano /etc/sudoers`
			- `USER ALL=(ALL)  ALL`
=======
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
	- Логин под root
		- Разрешен
			- `PermitRootLogin yes`
		- Запрещен
			- `PermitRootLogin no
		- Только по SSH ключам
			- `PermitRootLogin prohibit-password`
<<<<<<< HEAD
				- *defualt Yes*
			- `PasswordAuthentication no`
	- Черные списки
		- [Black List DenyHosts](Black%20List%20DenyHosts.md)
- `sudo systemctl restart ssh`
	- `service ssh restart`
	- `service sshd restart`

## Настройка подключения по SSH ключам
- Generate SSH key
	-  [SSH key generation](SSH%20key%20generation.md)
	- http://www.chiark.greenend.org.uk/%7Esgtatham/putty/download.html
	- запустить PuTTYgen и нажать кнопку «Generate»
	- Для ускорения генерации необходимо хаотично передвигать курсор мыши.
	- Сохранение приватного ключа
		- ![[4.png|300]]
		- Сохранить в нужную папку
	- Сохранение публичного ключа
		- Скопировать из окна публичный ключ
		- формат `ssh-rsa ...KEY... rsa-key-20231231`
- Загрузка публичного ключа
	- Подключиться к серверу по SSH через **WinSCP**
		- root
			- `/root/.ssh/`
		- other Users
			- `/home/USER/.ssh/`
		- create file
			- authorized_keys
	- Подключиться к серверу по SSH
		- root
		- `mkdir ~/.ssh`
			- for root, other in `mkdir /home/trsteep/.ssh`
		- `nano /root/.ssh/authorized_keys`
	- Ключ в формате putty
		- `ssh-rsa ...KEY... rsa-key-20231231`
- Настройка аутентификации только по ключам
	- `sudo nano /etc/ssh/sshd_config`
		- `PermitRootLogin prohibit-password`
			- *defualt Yes*
		- `PasswordAuthentication no`
			- *defualt Yes*
		- `UsePAM no`
	- `sudo systemctl restart ssh`
	- 
- Connect SSH with Key
	- Клиент Windows
		- http://www.chiark.greenend.org.uk/%7Esgtatham/putty/download.html
		- Добавление приватного ключа в PuTTY
			- Connection -> SSH -> Auth
				- Путь к секретному файлу с SSH ключом
			- ![[6.png|300]]
			- MremoteNG
				- ![|250](mRemoteNG-Session.webp)
	- Клиент linux
		- Putty
			- `putty`
		- ssh
			- `ssh root@185.104.114.90 -p 150`
=======
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

>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7

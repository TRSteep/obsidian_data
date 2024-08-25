#linux  #debian 
https://zalinux.ru/?p=5066

Можно не обращать внимание на предупреждение «apt-key is deprecated», но правильно делать так:
- Удаленный ключ
	- `curl -s URL | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/ИМЯ.gpg --import`
- Локальный ключ
	- `cat ФАЙЛ.pub | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/ИМЯ.gpg --import`
- С сервера ключей
	- `sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/rabbit.gpg --keyserver keyserver.ubuntu.com --recv 6B73A36E6026DFCA`
- Затем нужно дать права на файл
	- `sudo chmod 644 /etc/apt/trusted.gpg.d/ИМЯ.gpg`
- Информация о ключах
	- `gpg --list-keys --keyring /etc/apt/trusted.gpg.d/ФАЙЛ.gpg`
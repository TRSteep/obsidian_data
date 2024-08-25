#SSH 
# Windows
## Putty

# Linux
- `ssh-keygen -b 4096`
	- По умолчанию создается по пути
		- `~/.ssh/id_rsa`
- Секретный ключ
	- `cat ~/.ssh/id_rsa.pub`
- Публичный ключ
	- `cd ~/.ssh`
		- Если папки нет, создаем
			- `mkdir -p ~/.ssh`
	- `nano ~/.ssh/authorized_keys`
		- Добавляем публичный ключ
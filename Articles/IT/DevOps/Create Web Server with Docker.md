#docker #debian #web #server

* https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose
* https://habr.com/ru/articles/670938/
* https://wiki.pwodev.com/%D0%BB%D0%BE%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9-%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80-%D0%BD%D0%B0-docke/

## Install Docker
[Docker Install on Debian](obsidian://open?vault=Obsidian%20Vault&file=Install%20Docker%20Debian)

---
## Docker compose
https://habr.com/ru/companies/ruvds/articles/450312/
- cd /home/USER
- mkdir client
- mkdir server
- nano docker-compose.yml
	- ctrl +o

### Server (Серверная часть)
- cd server
	- простой веб-сервер. Он будет отдавать клиентам файл `index.html`, содержимое которого позже будет выводиться на веб-странице
	- nano server.py
```
#!/usr/bin/env python3

# Импорт системных библиотек python.
# Эти библиотеки будут использоваться для создания веб-сервера.
# Вам не нужно устанавливать что-то особенное, эти библиотеки устанавливаются вместе с Python.

import http.server
import socketserver

# Эта переменная нужна для обработки запросов клиента к серверу.

handler = http.server.SimpleHTTPRequestHandler

# Тут мы указываем, что сервер мы хотим запустить на порте 1234. 
# Постарайтесь запомнить эти сведения, так как они нам очень пригодятся в дальнейшем, при работе с docker-compose.

with socketserver.TCPServer(("", 1234), handler) as httpd:

    # Благодаря этой команде сервер будет выполняться постоянно, ожидая запросов от клиента.

   httpd.serve_forever()
```
- ctrl +x, Y
- nano index.html
```
Docker-Compose is magic!
```
- nano Dockerfile
```
# На всякий случай напоминаю, что Dockerfile всегда должен начинаться с импорта базового образа.
# Для этого используется ключевое слово 'FROM'.
# Здесь нам нужно импортировать образ python (с DockerHub).
# В результате мы, в качестве имени образа, указываем 'python', а в качестве версии - 'latest'.

FROM python:latest

# Для того чтобы запустить в контейнере код, написанный на Python, нам нужно импортировать файлы 'server.py' и 'index.html'.
# Для того чтобы это сделать, мы используем ключевое слово 'ADD'.
# Первый параметр, 'server.py', представляет собой имя файла, хранящегося на компьютере.
# Второй параметр, '/server/', это путь, по которому нужно разместить указанный файл в образе.
# Здесь мы помещаем файл в папку образа '/server/'.

ADD server.py /server/
ADD index.html /server/

# Здесь мы воспользуемся командой 'WORKDIR', возможно, новой для вас.
# Она позволяет изменить рабочую директорию образа.
# В качестве такой директории, в которой будут выполняться все команды, мы устанавливаем '/server/'.

WORKDIR /server/
```

### Client (Клиентская часть)


---
1. Defining the Web Server Configuration
	* create a project directory for your WordPress setup
		* ```mkdir wordpress```
		* ```cd wordpress```
		* ```mkdir nginx-conf```
		* ```nano nginx-conf/nginx.conf```
2. Defining Environment Variables
	* ```nano .env```
		* ```
			MYSQL_ROOT_PASSWORD=your_root_password
			MYSQL_USER=your_wordpress_database_user
			MYSQL_PASSWORD=your_wordpress_database_password```
	* ```git init```
	* ```nano .gitignore```
		* ```.env```
	* ```nano .dockerignore```
		* ```
			.env
			.git
			docker-compose.yml
			.dockerignore```
3. Defining Services with Docker Compose
	* ```nano docker-compose.yml```
	* ```version: '3'
		
		services:
		  db:
		    image: mysql:8.0
		    container_name: db
		    restart: unless-stopped
		    env_file: .env
		    environment:
		      - MYSQL_DATABASE=wordpress
		    volumes: 
		      - dbdata:/var/lib/mysql
		    command: '--default-authentication-plugin=mysql_native_password'
		    networks:
		      - app-network```
  - 
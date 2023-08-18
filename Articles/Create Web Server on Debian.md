#docker #debian #web #server
* https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose
* https://habr.com/ru/articles/670938/
* https://wiki.pwodev.com/%D0%BB%D0%BE%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9-%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80-%D0%BD%D0%B0-docke/

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
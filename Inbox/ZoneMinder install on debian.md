#dvr #linux  #debian 

# Install 
- MariaDB
	- `sudo apt install mariadb-server`
	- `sudo mariadb`
		- `CREATE DATABASE zm;`
		- `CREATE USER zmuser@localhost IDENTIFIED BY 'zmpass';`
		- `GRANT ALL ON zm.* TO zmuser@localhost;`
		- `FLUSH PRIVILEGES;`
		- `exit;`
		- `exit`
- ZoneMinder
	- `sudo apt install zoneminder`
	- `sudo echo 'deb http://deb.debian.org/debian bookworm-backports main contrib' >> /etc/apt/sources.list`
	- `sudo apt update`
	- `sudo apt -t bookworm-backports install zoneminder`


# Config admin
- Configure database
	- `mariadb -u zmuser -p zm < /usr/share/zoneminder/db/zm_create.sql`
- Setup permissions for zm.conf
	- `sudo chgrp -c www-data /etc/zm/zm.conf`
- Tweak Apache configuration
```bash
sudo a2enconf zoneminder
sudo systemctl reload apache2.service
sudo systemctl restart zoneminder.service
sudo systemctl status zoneminder.service
```

## Test connection
- ip a
- http://IP

# Config
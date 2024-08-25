#debian #security #firewall 

## Firewall status
- Rules list
	- `sudo ufw status numbered`
- Status
	- `sudo ufw status verbose`
	- `sudo ufw show raw`
- Open Ports
	- `sudo ufw show listening`

## Install
- `sudo apt install ufw`

## Configure
- `sudo nano /etc/default/ufw`
	- IPv6
		- `IPV6=yes`
- Default rule
	- `sudo ufw allow ssh`
	- `sudo ufw default deny incoming`
	- `sudo ufw default allow outgoing`
- Main Rules
	- SSH
		- `sudo ufw allow ssh`
			- `sudo ufw allow 22/tcp`
			- `sudo ufw limit 22/tcp comment SSH`
				- подключения блокируются, если пользователь пытается создать шесть и больше подключений за 30 секунд
		- Non standart port
			- `sudo ufw allow from 203.0.113.4 any port 202 comment COMMENT`
		- Insert rule
			- `sudo ufw insert 5 allow 2083 comment Trojan`
	- Web
		- `sudo ufw allow http`
		- `sudo ufw allow https`
- Build in App
	- `ufw app list`
- Enable Firewall
	- `sudo ufw enable`

## Additional Configure
- Source
	- `sudo ufw allow from 203.0.113.4`
	- `sudo ufw allow from 203.0.113.4 to any port 22`
	- `sudo ufw allow from 203.0.113.0/24`
	- `sudo ufw allow from 203.0.113.0/24 to any port 22`
- Ports range
	- `sudo ufw allow 6000:6007/tcp`
	- `sudo ufw allow 6000:6007/udp`
- Deny
	- `sudo ufw deny http`
	- `sudo ufw deny from 203.0.113.4`
- Delete
	- `sudo ufw delete 7`
- Disable IPv6
	- `sudo nano /etc/default/ufw`
		- `IPV6=no`
- Full
	- `sudo ufw allow proto tcp from 0.0.0.0/24 to 192.168.1.5 port 3318 comment FULLCOMMENT`

## LOG
- Enable logging
	- `sudo ufw logging on`
	- Log LVL
		- `sudo ufw logging low`
			- only block
		- `sudo ufw logging medium`
			- block + invalid + new connections
		- `sudo ufw logging high`
			- medium + plus all packets with rate limiting
		- `sudo ufw logging full`
			- all connections
	- `sudo ufw status verbose`
- Show logs
	- dmesg
		- `sudo dmesg | grep -v UFW`
		- Alieas
			- `alias dmesg='dmesg --color=always | grep -v UFW --color=always'`
			- `alias dmesgufw='dmesg --color=always | grep -v UFW --color=always'`
	- rsyslog
		- Install
			- `apt install rsyslog -y`
			- `systemctl start rsyslog`
			- `systemctl enable rsyslog`
		- `sudo less /var/log/ufw.log`
		- `tail -f /var/log/ufw.log`
			- последние 10 строк
- Log config (debug)
	- `sudo nano /etc/rsyslog.d/20-ufw.conf`
## Delete rules
- `sudo ufw status numbered`
	- `sudo ufw delete 2`
- `sudo ufw delete allow http`
- `sudo ufw delete allow 80`

## GUI
- Gufw Firewall
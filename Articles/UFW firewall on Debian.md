#debian #firewall #ufw
## Firewall status
- Rules list
	- `sudo ufw status numbered`
- Status
	- `sudo ufw status verbose`

## Install
- `sudo apt install ufw`

## Configure
- `sudo nano /etc/default/ufw`
	- IPv6
		- `IPV6=yes`
- Default rule
	- `sudo ufw default deny incoming`
	- `sudo ufw default allow outgoing`
- Main Rules
	- SSH
		- `sudo ufw allow ssh`
		- Non standart port
			- `sudo ufw allow 22`
	- Web
		- `sudo ufw allow http`
		- `sudo ufw allow https`
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

## Delete rules
- `sudo ufw status numbered`
	- `sudo ufw delete 2`
- `sudo ufw delete allow http`
- `sudo ufw delete allow 80`

---
Info
- https://telegra.ph/Kak-nastroit-brandmauehr-s-UFW-na-Ubuntu-08-07
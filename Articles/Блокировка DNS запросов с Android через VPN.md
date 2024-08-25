#dns #vpn

- pi-hole2vpn
	- https://github.com/3DRaven/pi-hole2vpn/
		- https://habr.com/ru/articles/756290/
	- Debian + ssh
	- Ansible
		- `sudo apt-add-repository ppa:ansible/ansible`
		- `sudo apt-get update`
		- `sudo apt-get install ansible`
	- Download from GIT
		- GIT
			- `sudo apt-get install git-core`
			- `mkdir ~/git`
			- `cd ~/git`
			- `git clone https://github.com/3DRaven/pi-hole2vpn.git`
		- Download
			- `wget -P ~/ https://github.com/3DRaven/pi-hole2vpn/archive/refs/heads/master.zip`
			- `unzip ~/master.zip`
			- `mv ~/*-master ~/dir-name`
	- Config
		- `cp group_vars/vpn.example group_vars/vpn`
			- `nano group_vars/vpn`
		- `cp inventory.example inventory`
			- `nano inventory`
	- Playbook
		- `ansible-playbook --ask-become-pass ./deploy.yml`
		- `ansible-playbook --ask-become-pass ./deploy.yml --tags adblock_add `

---
## Автоматизация
- tasker
	- Разблокировка устройства - запуск VPN и включение синхронизации
	- отключён экран более 10 минут - остановка VPN
	- отключён экран более 3 часов - остановка синхронизации
	- При этом, push будут работать через google push service
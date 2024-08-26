#debian #nix #network 

# Hostname
- `nano /etc/hostname`
	- HOSTNAME
	- 127.0.0.1 localhost HOSTNAME
# Base Network config
- Show interfaces
	- `ip a`
- Config interfaces
	- `nano /etc/network/interfaces`
		- `source /etc/network/interfaces.d/*`
	- Автоматическое получение IP
		- `auto eth0`
		- `iface rth0 inet dhcp`
	- Статические IP
		- `allow-hotplug eth0`
		- `iface eth0 inet static`
			- `address 192.168.0.2/24`
			- `gateway 192.168.0.1`
			- `dns-nameserver 8.8.8.8`
		- DNS
			- `nano /etc/resolv.conf`
				- `nameserver 8.8.8.8`
	- Сохранить файл
	- Перезагрузить интерфейс
		- `systemctl restart networking`
- Change interface
	- `ip link set dev eth0 up/down`
	- `ifdown eth0 down`
	- `ifdown eth0 up`
- Troubleshoot
	- Interface eth0 not configured
		- `nano /run/network/ifstate`
			- `eth0=eth0`

---
# IP tool
## Link - управление сетевыми устройствами
- `ip link show` - посмотреть физические устройства
- `ip link set eth0 down`
- `ip link set eth0 up`

## Address - управление адресами
- `ip address show` - посмотреть ip адреса
- `ip address add 192.168.0.44/24 dev eth0` - добавление IP (до перезагрузки)

## Route - управление маршрутизацией
- `ip route show` - посмотреть таблицу маршрутизации
- `ip route add 192.168.11.0/24 via 192.168.0.1` - добавление маршрута (до перезагрузки)

### Static route
- `nano /etc/network/interfaces`
	- добавление маршрута
		- `up ip route add 192.168.5.0/24 via 192.168.0.10`

## Neight - управление arp таблицей
- `ip neigh show` - посмотреть arp таблицу
- `ip neigh flush` -  очистка arp таблицы
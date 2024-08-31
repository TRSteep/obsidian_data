#firewall #router #security 

# Firewall
## pfSense
GUI firewall based on FreeBSD
- https://www.pfsense.org/
	- https://atxfiles.netgate.com/mirror/downloads/
- pfSense describes itself as the most trusted open source firewall
- Functions
	- Firewall
	- Router
	- DHCP
	- DNS
	- VPN
		- OpenVPN
		- IPsec
		- WireGuard

## OPNsense
GUI firewall based on FreeBSD
- https://opnsense.org/
	- https://opnsense.org/download/
		- dvd: ISO
- OPNsense implements a stateful firewall and enables users to group firewall rules by category, which according to its website, is a handy feature for more demanding network setups
- Functions
	- Firewall
	- Load Balance

## MikroTik RouterOS
Linux-based operating system
- https://mikrotik.com/download

## NethServer
CentOS-based Linux distribution for servers
- https://www.nethesis.it/
- Functions
	- firewall
	- web filter
	- IPS/IDS
	- VPN server

## OpenWrt
- https://openwrt.org/
- прошивка с открытым исходным кодом на основе Linux для беспроводных маршрутизаторов.
- developed specifically for use in routers and networks

## DD-WRT
альтернативная прошивка OpenSource на основе Linux, подходящая для большого количества маршрутизаторов WLAN
- https://dd-wrt.com/site/index

---
---
# IDS
## Snort
Snort проверяет все входящие пакеты на признаки известных видов сетевых атак (DDoS, сканирование портов, попытки авторизации брутфорсом и так далее)
- Plus
	- простота в написании своих правил;
	- частые обновления
- Instructions
	- https://tech-geek.ru/snort/
## Suricata
## Bro (renamed Zeek)
## Host-based IDS (HIDS)
## ClearOS
- https://www.clearos.com/
- ClearOS is a CentOS-based distro that’s designed as a full featured replacement to commercial server distros like Red Hat Enterprise Server or Windows Small Business Server. 
- Once installed, you can administer your ClearOS-powered firewall from a web-based management interface. The administration interface is intuitive to use, and will not only help you configure and monitor your firewall, but can also be used to flesh out the distro for several other network services with a few clicks. 
#linux #security 

## Отключение ICMP пакетов на уровне ядра
- `sudo nano /etc/sysctl.conf`
	- `net.ipv4.icmp_echo_ignore_all = 1`
- `sysctl -p`
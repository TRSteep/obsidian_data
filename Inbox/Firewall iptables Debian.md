#debian #firewall #linux #security  #iptables
В debian 12 фаервол iptables вшит в ядро и в отличие от предыдущих debian не имеет статуса службы

# Check rules
- Просмотр списка правил
	- `iptables -L -n`
	- `iptables -L -n -v`
- Просмотр списка правил с нумерацией
	- `iptables -L --line-numbers`
	- `iptables -L INPUT -n --line-numbers`
	- `iptables -L FORWARD -n --line-numbers`
- NAT
	- `iptables -t nat -nvL`

# Rules
## Add Rules
- ### Access
	- Разрешим подключение по 22 порту
		- `iptables -A INPUT -p tcp --dport 22 -j ACCEPT`
	- Разрешим подключение по 443 порту и сделаем правило первым
		- `iptables -A INPUT 1 -p tcp --dport 443 -j ACCEPT`
	- Вставляем правило в нужное место по номеру
		- `iptables -I INPUT 2 -s 10.10.10.10 -j DROP`
- ### Deny
	- Запретим подключение для определенного ip к 25 порту
		- `iptables -A INPUT -s xx.ip.xx.ip -p tcp –destination-port 25 -j DROP`
	- Запретим подключение для всей подсети
		- `iptables -A INPUT -s 192.168.0.0/24 -j DROP`
## Remove rules
- Удаление по номеру правила
	- `iptables -D INPUT 1`
	- `iptables -D INPUT 3` (начинается с 1)
- Удаление по содержанию правила
	- iptables -D INPUT -p tcp --dport 80 -j ACCEPT
## Port forward
- Включаем forward
```bash
/etc/sysctl.conf
# Controls IP packet forwardingnet.ipv4.ip_forward = 1
```

- Проверяем
```bash
grep -i forward /etc/network/options
```

- Rules
```bash
iptables -t nat -I PREROUTING -p tcp -d 80.1.1.1 --dport 20125 -j DNAT --to-destination 172.16.0.104:20081 
iptables -t nat -I PREROUTING -p tcp -d 80.1.1.1 --dport 37777 -j DNAT --to-destination 172.16.0.104:37777 
iptables -t nat -I PREROUTING -p tcp -d 80.1.1.1 --dport 37778 -j DNAT --to-destination 172.16.0.104:37778 
iptables -I FORWARD -d 80.1.1.1 -j ACCEPT 
iptables -I FORWARD -d 172.16.0.104 -j ACCEPT
```

## Drop on interface
```bash
iptables -I FORWARD -i vlan3101 -j DROP
iptables -I FORWARD -o vlan3101 -j DROP 
iptables -I FORWARD -i vlan3101 ! -s 172.17.1.11 -j DROP 
iptables -A FORWARD -s 172.17.0.0/16 ! -i vlan3101 -j ACCEPT 
iptables -A FORWARD -d 172.17.0.0/16 ! -o vlan3101 -j ACCEPT
```

## Сброс цепочки правил
Важно: правило по умолчанию перед вводом команды сброса правил, так как это приведет к потере соединения с сервером.
- Сброс цепочки accept
	- `iptables -F INPUT`
- Сброс всех правил
	- `iptables -F`
## Сохранение правил
После перезагрузке сервера все прописанные правила будут удалены, чтобы этого не происходило, установим утилиту.
- `apt install iptables-persistent`
В процессе установки будет предложено сохранить текущие настройки правил. iptables-persistent ищет файлы rules.v4 и rules.v6 в /etc/iptables и восстанавливает их при запуске сервера.
- Сохранение через iptables-persistent
	- `netfilter-persistent save`
- Сохранение через iptables
	- `iptables-save > /etc/iptables/rules.v4`
	- `ip6tables-save > /etc/iptables/rules.v6`
- Восстановление с сохранением текущих правил
	- `iptables-restore -n < /etc/iptables/rules.v4`
- Восстановление с заменой текущих правил
	- `iptables-restore < /etc/iptables/rules.v4`


# Base Config
## Default config
```bash
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
```
## Base config for use
- [IPtables base config](IPtables%20base%20config.md)

## Defence from scan
- Атакующий IP будет заблокирован на 24 часа (3600 x 24 = 86400 секунд)
```bash
iptables -A INPUT -m recent --name portscan --rcheck --seconds 86400 -j DROP
iptables -A FORWARD -m recent --name portscan --rcheck --seconds 86400 -j DROP
```

- Удалить атакующий IP после 24 часов
```bash
iptables -A INPUT -m recent --name portscan --remove
iptables -A FORWARD -m recent --name portscan --remove
```

- Эти правила добавляют сканеры в список portscan и регистрируют попытку
```bash
iptables -A INPUT -p tcp -m tcp --dport 139 -m recent --name portscan --set -j LOG --log-prefix "portscan:"
iptables -A INPUT -p tcp -m tcp --dport 139 -m recent --name portscan --set -j DROP
iptables -A FORWARD -p tcp -m tcp --dport 139 -m recent --name portscan --set -j LOG --log-prefix "portscan:"
iptables -A FORWARD -p tcp -m tcp --dport 139 -m recent --name portscan --set -j DROP
```
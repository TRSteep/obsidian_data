#STerra #cli #config

Информация
- https://www.s-terra.ru/upload/medialibrary/2b8/ver_3_scn15.pdf
- https://doc.s-terra.ru/rh_output/4.1/Client-E/output/mergedProjects/User_guide/%D1%81%D0%BF%D0%B5%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B5_%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B.htm

### Cluster
- IA-CSP-inet-ST-t1
	- 172.16.16.115
- IA-CSP-inet-ST-t2
	- 172.16.16.116

Проверка туннелей
`sa_mgr show`

Информация о маршрутизации
`ip route`

Просмотр состояния портов
`ip link show`

Конфигурация интерфейсов
`cat /etc/network/interfaces`

- Конфигурация 
	- `cat /etc/snmp/snmpd.conf`


---
### Cisco-like

Сначала бекап конфига
	Скопировать 

- Запуск Cisco-like консоли из системного shell
	- `cs_console`
- Вход в режим Enable, через пароль
	- `enable`
- Просмотр конфигурации
	- `show running-config`
- Вход в режим настроек как у cisco
	- `configure terminal`

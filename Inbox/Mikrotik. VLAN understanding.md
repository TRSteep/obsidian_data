#mikrotik #vlan 

## 802.1q
- Access (Untagged)
	- порт транслирует только один VLAN
- Trunk (Tagged VLAN)
	- порт транслирует несколько VLAN

## Type
- Tag Protocol Identifier (TPID) 
	- Указывает используемый протокол для тегирования. 
	- Для 802.1Q используется значение 0x8100
- TCI – Tag control information (PCP, 3 бит)
	- В 802.1q для задания приоритета передаваемого трафика
- DEI – Drop eligible indicator (DEI, 1 бит) 
	- Индикатор допустимости удаления. Может использоваться отдельно или совместно с PCP для указания кадров, которые могут быть отброшены при наличии перегрузки
- VID – — VLAN Identifier (VID, идентификатор VLAN, 12 бит)
	- Диапазон возможных значений от 0 до 4095.

## Mikrotik config
- brief
	- bridge or interface
	- 
- Bridge для каждого из VLAN-ов
	- Главное меню – Bridge, нажимаем «+»
		- ![|500](vlan_mikrotik_baza_2-min%201.jpeg)
- создать непосредственно VLAN
	- Главное меню – Interfaces — вкладка VLAN, нажимаем «+»
		- В качестве интерфейса указываем bridge или interface
		- ![|500](vlan_mikrotik_baza_2_2.jpeg)
		- ![|500](vlan_mikrotik_baza_8-min-1.jpeg)
- назначим IP адрес для каждого VLAN-на
	- Главное меню – IP – Addresses, нажимаем «+»
	- ![|500](vlan_mikrotik_baza_9-min.jpeg)
- настроим DHCP Server для каждого из VLAN bridge
	- Главное меню – IP – DHCP Server, нажимаем «DHCP Setup» выбираем интерфейс bridge
		- ![500](vlan_mikrotik_baza_10-min.jpeg)
		- ![|500](vlan_mikrotik_baza_4-min%201.jpeg)
- переводим нужные порты в состояние access (Untagged без VLAN)
	- Главное меню – Bridges, вкладка VLANs, нажимаем «+»
	- ![|500](vlan_mikrotik_baza_5-min.jpeg)
- изолирование VLAN-ов
	- Главное меню IP – Routes вкладка Rules нажимаем «+»
		- ![|500](vlan_mikrotik_baza_6-min.jpeg)
- настройка беспроводной сети
	- **VLAN Mode – use tag** (выбираем использовать  метку VLAN, другими словами переводим беспроводный интерфейс в access), **VLAN ID – 30** ( прописываем метку VLAN). Нажимаем «ОК» и создаем еще один беспроводный интерфейс, но уже для VLAN 40 (он будет отличаться от предыдущих настроек следующими параметрами **SSID – Test40**, **VLAN ID – 40**, а также может быть выбран другой профиль безопасности)
	- ![|600](vlan_mikrotik_baza_12-min-1024x347.jpeg)
	- Cледующим шагом будет **создание и объединение всех интерфейсов** (физических и виртуальных) в один Bridge. Главное меню – Bridge, нажимаем «**+**» для создания bridge. Далее даем ему имя (в примере bridge_AP) и нажимаем кнопку ОК. Переходим во вкладку Ports и нажимаем «**+**» добавляем все порты в созданный ранее bridge_AP.
	- ![|600](vlan_mikrotik_baza_13-min-1024x489.jpeg)
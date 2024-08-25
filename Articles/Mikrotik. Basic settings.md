#mikrotik #config #firewall #router 

# Дефолтные настройки
- Winbox
	- появится на закладке Neighbors
- логин Admin, без пароля
- сеть по умолчанию 192.168.88.0/24


# Базовая настройка
## Hostname
- `/system identity`
	- `set name=HOSTNAME
# Порты
- IP
	- 

# Бекап
## Полный бекап конфига Формат .backup
- Full BackUp

## Текстовый бекап .rsc
- Особенности
	- Не сохраняет список пользователей RouterOS
	- Не включает default configuration
	- Для выгрузки полной конфигурации применяйте verbose
	- Скрывает важную информацию (ключи шифрования, пароли VPN)
	- Часто требуется обработка напильником
- BackUp Text Config
	- `export file=flash/2023.10.01_port_Mikrotik.rsc`
	- `export file=flash/2024.02.11_before_IKEv2.rsc`
	- `export file=flash/2024.03.10_before_V7.rsc`
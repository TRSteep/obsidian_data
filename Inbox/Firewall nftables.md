#firewall #security #debian 

# Info
- https://linuxhandbook.com/iptables-vs-nftables/
- https://habr.com/ru/articles/684524/
- https://ru.wikipedia.org/wiki/Nftables
- https://wiki.nftables.org/wiki-nftables/index.php/Main_Page
- Структура правил
	- Правило->Цепочка->Таблица
## Особенности
- Таблицы для цепочек можно называть как угодно, но нужно указывать тип
- Типы таблиц
	- ip (default)
	- ip6
	- inet
	- arp
	- bridge
	- netdev
- Хуки - используются для того чтобы запустить правило в определенным момент обработыки сетевых данных.
	- prerouting - обработка всех входящих пакетов, это вообще ВСЕ пакеты, которые могут быть приняты системой.
	- input - пакеты, которые пришли для системы.
	- forward - пакеты, пересылаемые другой системе
	- output - пакеты, от операционной системы во внешнюю сеть
	- postrouting - все пакеты, которые покидают систему, это те которые генерируются ОС и те, которые просто были пересланы
	- ingress - доступен только для inet, начиная с версии ядра 5.10, тут обработка происходит для всех пакетов, которые приходят в систему, срабатывает раньше других хуков.
- Все правила разделяются на базовые и регулярные правила
	- базовые правила должны подчиняться следующему шаблону
		- `type <> hook <> priority <>;`
		- параметры:
			- nat
			- route
			- filter


# Install
- `sudo apt install nftables`
- run services
	- `sudo systemctl enable nftables.service`

# Configure
## Обычный режим настройки
- небольшой шаблон для передачи команд в утилиту ntf
	- `nft <флаги> -I <директория> -f <имя файла> -i <команда>`
 
## Интерактивный режим
```bash
nft --interactive
```
Можно просто вводить новые правила как будто работаете с базой данных
Пример работы в интерактивном режиме
```bash
nft --interactive
create table inet test1 
add chain inet test1 packetin { type filter hook input priority 0; }
add rule inet test1 packetin counter
```

Просмотр
```bash
nft list ruleset
```

# Examples
## Аналогичные команды iptables
- запрещение обращения по tcp протоколу для порта 9090
- iptables
```bash
iptables -A INPUT -i enp0s3 -p tcp --dport 9090 -j DROP
```
- nft
```bash
nft --interactive
add table inet MyTable
add chain inet MyTable MyChain { type filter hook input priority 0; policy drop}
add rule inet MyTable MyChain tcp dport 9090 counter drop
```
- analog
```bash
nft --interactive
add table inet MyTable
add chain inet MyTable MyChain {type filter hook input priority 0;}
add rule inet MyTable MyChain tcp dport 9090 ct state new log flags all prefix "Connection was established for TEST PORT 9090:" accept
```

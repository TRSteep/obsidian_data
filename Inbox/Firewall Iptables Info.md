#linux #security #firewall #iptables

# Прохождение трафика
## Схема
[Drawing_iptables_chain_tables](Drawing_iptables_chain_tables.md)
![](Pasted%20image%2020240807202012.png)
![|500](Pasted%20image%2020240820171813.png)
## Tables
В Iptables есть четыре основные таблицы:\
- ### Filter
	- основная таблица, используемая для фильтрации пакетов
	- если таблица не указана явно, то используется filter
	- цепочки INPUT, FORWARD и OUTPUT
- ### NAT
	- таблица используется для настройки NAT (Network Address Translation).
	- предназначен для преобразования адресов и портов источника и назначения пакетов
	- цепочки: PREROUTING, OUTPUT, POSTROUTING
- ### Mangle
	- таблица используется для специальной обработки пакетов.
	- используется для модификации некоторых заголовков (ToS (Type of Service), TTL (Time To Live), MARK) и маркировке пакетов и соединений
	- цепочки PREROUTING, INPUT, FORWARD, OUTPUT и POSTROUTING
- ### RAW
	- таблица используется для обхода системы отслеживания состояний
	- предназначена для обработки пакетов прежде, чем они будут переданы системе conntrack
	- цепочки PREROUTING и OUTPUT
- ### security
	- используется для работы совместно с системами принудительного контроля доступа в частности с SELinux и AppArmor.
	- цепочки INPUT, FORWARD, OUTPUT

## Chains
Каждая таблица состоит из набора цепочек:
- PREROUTING - используется для всего входящего трафика до принятия первого решения о маршрутизации
- INPUT - применяется для входящего трафика текущего узла
- FORWARD - через нее проходит транзитный трафик узла
- OUTPUT - применятся для исходящего трафика текущего узла
- POSTROUTING - используется для всего исходящего трафика после принятия всех решений о маршрутизации

## Targets
- **ACCEPT**. Allows the packet to pass through the firewall.
- **DROP**. Discards the packet without informing the sender.
- **REJECT**. Discards the packet and returns an error response to the sender.
- **LOG**. Records packet information into a log file.
- **SNAT**. Stands for Source Network Address Translation. Alters the packet's source address.
- **DNAT**. Stands for Destination Network Address Translation. Changes the packet's destination address.
- **MASQUERADE**. Alters a packet's source address for dynamically assigned IPs.

# Основные модификаторы
## Действия с пакетом
- ACCEPT – пропустить пакет данных далее по цепочке;
- DROP – полностью удалить пакет;
- REJECT – отклонить запрос и направить пользователю ответ с информацией об этом;
- LOG – инициируется запись в лог-файл об обработанном пакете;
- QUEUE — отправляет пакет в очередь приложению для дальнейшего взаимодействия;
### NAT
- DNAT — подменяет адрес получателя в заголовке IP-пакета, основное применение — предоставление доступа к сервисам снаружи, находящимся внутри сети;
- SNAT — служит для преобразования сетевых адресов, применимо, когда за сервером находятся машины, которым необходимо предоставить доступ в Интернет, при этом от провайдера имеется статический IP-адрес;
- MASQUERADE — то же, что и SNAT, но главное отличие в том, что может использоваться, когда провайдер предоставляет динамический адрес, создаёт дополнительную нагрузку на систему по сравнению с SNAT;
### Дополнительные действия
- TTL — используется для изменения значения поля одноименного заголовка IP-пакета, устанавливает время жизни пакета.
- TOS — позволяет управлять битами в одноименном поле заголовка IP-пакета;
- ULOG — более продвинутый вариант записи информации, может писать как в обычный текстовый файл, так и в базу данных;
- MARK — позволяет помечать определенные пакеты, например для маршрутизации, данная метка перестает существовать, как только пакет покинет брандмауэр;
- CONNMARK — то же самое, что и MARK, только для соединений;
- RETURN — прекращение движения пакета по текущей цепочке и возврат в предыдущую цепочку. Если текущая цепочка единственная — к пакету будет применено действие по умолчанию;
- REDIRECT — перенаправляет пакет на указанный порт, в пределах этого же узла, применяется для реализации «прозрачного» прокси;

---
# Info
- https://1cloud.ru/help/linux/nastrojka_linus-firewall_iptables
- https://timeweb.com/ru/community/articles/nastroyka-iptables-dlya-chaynikov
- https://zvenst.ru/nastroika-iptables-v-debian-podrobnoe-rukovodstvo/
- https://serverspace.ru/support/help/nastroika-firewall-iptables-na-linux/
- https://ruvds.com/ru/helpcenter/configure-iptables/
- https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands


---
# Базовые команды Iptables
## Просмотр текущих правил\
- `iptables -L`
	- покажет все правила в таблице filter
- `iptables -L --line-numbers`
	- покажет все правила в таблице filter с номерами
- `iptables -t nat -L`
	- правила в таблице NAT

## Путь к правилам
- `/etc/iptables/rules.v4`
- `/etc/iptables/rules.v6`

## Добавление новых правил
- без указания таблицы правило добавляется к Filter
- ### Блокировка IP-адреса
	- `iptables -A INPUT -s 192.168.0.100 -j DROP`
		- заблокировать весь входящий трафик от IP-адреса 192.168.0.100
		- -A INPUT : в цепочку INPUT
		- -s 192.168.0.100 : исходный IP-адрес
		- -j DROP : отбрасывают пакеты
- ### Открытие порта для входящего трафика
	- `iptables -A INPUT -p tcp --dport 443 -j ACCEPT`
		- разрешить входящие по TCP/443 порту
		- -p tcp : протокол TCP
		- --dport 80 : порт назначения
		- -j ACCEPT : Разрешить
- ### Изменение дефолтного политики
	- `iptables -P INPUT DROP`
		- отклонить все входящие пакеты по умолчанию

### Пример ограничение входящих портов, разрешение всех исходящих
```bash
iptables -A OUTPUT -j ACCEPT iptables -A INPUT -p tcp --dport 22 -j ACCEPT iptables -A INPUT -p tcp --dport 80 -j ACCEPT iptables -A INPUT -p tcp --dport 443 -j ACCEPT iptables -P INPUT DROP
```
В этом примере разрешен весь исходящий трафик, а входящий трафик разрешен только на порты 22 (SSH), 80 (HTTP) и 443 (HTTPS). Все остальные входящие пакеты отклоняются.

## Удаление правил
- `iptables -D INPUT 1`

## Сохранение и восстановление правил
По умолчанию, правила iptables не сохраняются после перезагрузки системы. Чтобы сохранить текущие правила, вы можете использовать команду iptables-save
- `iptables-save > /path/to/iptables/rules`
- `iptables-restore < /path/to/iptables/rules`
- Для более простой работы можно установить iptables-persistent
	- `sudo apt install iptables-persistent`

# Расширенное использование Iptables
## Логирование
- `iptables -A INPUT -j LOG --log-prefix "Dropped Packet: " iptables -A INPUT -j DROP`
	- --log-prefix "Dropped Packet: " : добавляет указанный префикс к каждому лог-сообщению, что упрощает фильтрацию и анализ логов

## Создание пользовательских цепочек
- `iptables -N MY_CHAIN iptables -A MY_CHAIN -s 192.168.0.100 -j DROP iptables -A INPUT -j MY_CHAIN`
	- -N MY_CHAIN : создает новую цепочку с именем MY_CHAIN
	- Затем добавляется правило, которое отбрасывает все пакеты от 192.168.0.100
	- цепочка MY_CHAIN добавляется в цепочку INPUT, что означает, что все входящие пакеты будут также проходить через цепочку MY_CHAIN

## Использование состояний пакетов
- `iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT `
	- разрешить только входящие пакеты, которые являются частью уже установленного соединения
	- -m state : указывает на использование модуля состояний
	- --state : ESTABLISHED,RELATED указывает, что правило применяется только к пакетам, которые являются частью уже установленного или связанного соединения

## Использование Iptables для создания VPN
- `iptables -A INPUT -m policy --dir in --pol ipsec -j ACCEPT iptables -A OUTPUT -m policy --dir out --pol ipsec -j ACCEPT`
	- -m policy : указывает на использование модуля "policy"
	- --dir in и --dir out : указывают на направление трафика
	- --pol ipsec : указывает на использование IPsec политики

## Использование Iptables для ограничения скорости
- `iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m limit --limit 3/min -j ACCEPT`
	- -m limit --limit 3/min : указывает на ограничение скорости
	- остальная часть команды определяет, что она применяется к новым SSH-соединениям

## Использование Iptables для редиректа трафика
- `iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080`
	- -t nat : указывает на использование таблицы NAT
	- -A PREROUTING : добавляет правило в цепочку PREROUTING
	- --dport 80 : указывает на исходный порт
	- --to-port 8080 : указывает на порт назначения
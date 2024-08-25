#linux #vds 

## Info
- Источником адресов для черного списка является репозиторий
	- https://github.com/C24Be/AS_Network_List/

## Подготовка
### Сконфигурируем под наши цели системный журнал:
```bash
sudo nano /etc/rsyslog.d/50-default.conf
```
Спустимся в самый низ и добавим
```bash
:programname, isequal, "sudo" ~
:msg, contains, "Blocked IP attempt: " /var/log/blacklist/
blacklist.log
& ~
```
Закроем с сохранением (Ctrl+X затем Y и Enter)

Разрешим запись в каталог, в котором будут расположены файлы скрипта и логи
```bash
sudo chown syslog:adm /var/log/blacklist
sudo chmod 0755 /var/log/blacklist
```

Перезапустим службу rsyslog
```bash
sudo service rsyslog restart
```

## Создание и выполнение скрипта
Создадим пустой файл скрипта
```bash
sudo nano /var/log/blacklist/blacklist_updater.sh
```

Script
```bash
#!/bin/bash
# Создаем каталог, если он еще не существует
sudo mkdir -p /var/log/blacklist/
# Переименовываем существующий файл blacklist.txt в old_blacklist.txt
sudo mv /var/log/blacklist/blacklist.txt /var/log/blacklist/old_blacklist.txt
# Копируем файл blacklist.txt из источника по ссылке
if ! sudo wget -O /var/log/blacklist/blacklist.txt https://github.com/C24Be/AS_Network_List/raw/main/
blacklists/blacklist.txt; then
echo "Не удалось загрузить новый черный список. Оставляем старый список без изменений."
echo "$(date +"%Y-%m-%d %H:%M:%S") - Не удалось загрузить новый черный список. Оставляем старый список без
изменений." >> /var/log/blacklist/blacklist_updater.log
exit 1
fi
# Пути к файлам с IP-адресами
OLD_IP_FILE="/var/log/blacklist/old_blacklist.txt"
NEW_IP_FILE="/var/log/blacklist/blacklist.txt"
# Считываем IP-адреса из старого файла
old_addresses=()
while IFS= read -r ip || [[ -n "$ip" ]]; do
old_addresses+=("$ip")
done < "$OLD_IP_FILE"
# Считываем IP-адреса из нового файла
new_addresses=()
while IFS= read -r ip || [[ -n "$ip" ]]; do
new_addresses+=("$ip")
done < "$NEW_IP_FILE"
# Добавляем новые адреса и удаляем старые из правил
added=0
removed=0
for addr in "${new_addresses[@]}"; do
if ! sudo iptables -t raw -C PREROUTING -s "$addr" -j DROP &>/dev/null; then
sudo iptables -t raw -A PREROUTING -s "$addr" -j LOG --log-prefix "Blocked IP attempt: "
sudo iptables -t raw -A PREROUTING -s "$addr" -j DROP
((added++))
fi
done
for addr in "${old_addresses[@]}"; do
if ! grep -q "$addr" "$NEW_IP_FILE"; then
sudo iptables -t raw -D PREROUTING -s "$addr" -j LOG --log-prefix "Blocked IP attempt: "
sudo iptables -t raw -D PREROUTING -s "$addr" -j DROP
((removed++))
fi
done
# Сохраняем правила брандмауэра в файл
sudo sh -c "iptables-save > /etc/iptables/rules.v4"
# Выводим информацию о добавленных и удаленных адресах
echo "Добавлено адресов в черный список: $added"
echo "Удалено адресов из черного списка: $removed"
# Добавляем запись в лог-файл
echo "$(date +"%Y-%m-%d %H:%M:%S") - Добавлено адресов в черный список: $added, Удалено адресов из черного
списка: $removed" >> /var/log/blacklist/blacklist_updater.log
```
Закроем с сохранением (Ctrl+X затем Y и Enter)

Разрешим его запуск
```bash
sudo chmod +x /var/log/blacklist/blacklist_updater.sh
```

Запустим скрипт в первый раз, исполнение займет некоторое время:
```bash
sudo /var/log/blacklist/blacklist_updater.sh
```

Вы должны получить ответ вида:
Добавлено адресов в черный список: 898
Удалено адресов из черного списка: 0

### Разберем подробнее, что мы имеем.
- `/var/log/blacklist/` теперь содержит файлы
	- blacklist_updater.sh - сам скрипт, на случай если понадобится внести изменения
	- blacklist_updater.log - хранит лог результатов выполнения скрипта и фиксирует время
	- blacklist.log - тот самый лог, который хранит информацию о попытках обращения с заблокированных адресов к вашему серверу. Содержит порт, мак-адрес, свойства пакета и другую полезную информацию
	- blacklist.txt и old_blacklist.txt - копия файла из репозитория, а так же предыдущая версия этого файла, для отслеживания изменений в списке адресов
- Проверить, что все адреса теперь в черном списке можно командой:
	- `sudo nano /etc/iptables/rules.v4`
- Если по какой-то причине вам надо очистить всю цепочку PREROUTING в таблице raw, выполните следующую команду, которая удалит все добавленные адреса:
	- `sudo iptables -t raw -F PREROUTING`

## Создаем расписание выполнения
Можно запускать скрипт вручную, но лучше установить расписание, по которому он будет выполняться, например каждый день в определенное время.
Для начала узнаем время вашего сервера, оно может отличаться от времени вашего часового пояса:
- `date`
Создаем расписание, время используем то, что у сервера, для этого выполняем:
- `sudo crontab -e`
При первом запуске вероятно спросит каким редактором открыть, выбираем привычный nano.
В конце файла добавляем текст
```bash
0 9 * * * /bin/bash /var/log/blacklist/blacklist_updater.sh
```
Это создаст расписание на выполнение данного скрипта каждый день в 9 утра по времени сервера
Вот что означает каждое поле:
- 0 - минуты (от 0 до 59)
- 9 - часы (от 0 до 23)
- * - день месяца (от 1 до 31)
- * - месяц (от 1 до 12)
- * - день недели (от 0 до 7, где 0 и 7 - воскресенье)
Закроем с сохранением (Ctrl+X затем Y и Enter)
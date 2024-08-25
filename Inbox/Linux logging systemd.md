#linux #log 

# Info
- https://selectel.ru/blog/upravlenie-loggirovaniem-v-systemd/
- https://habr.com/ru/companies/ruvds/articles/533918/

# Show logs
- All logs
	- `journalctl`

## Log Filter
- Просмотр логов с момента текущей загрузки
	- `journalctl -b`
- Просмотр логов предыдущих сессий
	- сохранение информации о предыдущих сессиях поддерживается по умолчанию не во всех дистрибутивах Linux. Иногда его требуется активировать
	- Проверить хранение логов
		- `sudo nano /etc/systemd/journald.conf`
			- `[Journal]`
			- `Storage=persistent`
	- Просмотреть список предыдущих загрузок можно с помощью команды
		- `journalctl --list-boots`
	- Лог для конкретной загрузки, можно использовать идентификаторы как из первой, так и из второй колонки:
		- `journalctl -b 0`
		- `journalctl -b 9346310348bc4edea250555dc046b30c`
- Фильтрация по дате и времени
	- логи начиная с 17 часов 15 минут 20 июля 2015 года
		- `journalctl --since "2015-07-20 17:15:00"`
	- `journalctl ---since yesterday`
		- все лог со вчера
	- `journalctl --since 09:00 --until now`
		- логи с 9 до сейчас
	- `journalctl --since 10:00 --until "1 hour ago"`
		- логи с 10 до часа назад
- Фильтрация по приложениям и службам
	- используется опция -u
		- `journalctl -u nginx.service`
	- комбинация с временем
		-  `journalctl -u nginx.service --since yesterday`
		- `journalctl -u nginx.service -u php-fpm.service —since today`
- Фильтрация по процессам, пользователям и группам
	- Необходимо указать его идентификационный номер (PID)
		- `journalctl _PID=381`
	- Для просмотра логов процессов, запущенных от имени определённого пользователя или группы, используются фильтры `_UID` и `_GID` соответственно
		- Определим сначала ID  пользователя www-data
			- `id -u www-data`
		- Затем просмотр логов
			- `journalctl _UID=33`
	- Вывести на консоль список пользователей, о которых имеются записи в логах
		- `journalctl -F _UID`
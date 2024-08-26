#nix #linux  #security 

## Основные права
- Владелец полные, остальные читать и выполнять
	- `chmod -R 755 \`
- Владелец полные, группа читать и выполнять, остальные читать
	- `chmod -R 754 \`

# Просмотр прав
- `ls -l`
	- `ls -l /`

# Изменение прав
- `chmod [разрешение] [путь]`
- Добавление прав
	- `chmod ugo+rwx FILE`
- Смена владельца
	- `chown USER PATH`
	- `chown USER PATH`
- Добавление прав выполнения
	- `chmod F+x FILE`
		- Флаги F пользователя
			- a - все
			- u - владелец файла
			- g - группа
			- o - другие пользователи
		- Флаги X разрешения
			- - — нет прав
			- r — read (чтение)
			- w — write (запись)
			- x — execute (выполнение, для папок -чтение)
			- **-wx** — разрешено изменение и выполнение, но нельзя смотреть каталог
			- **r-x** — только чтение и выполнение, без права на запись
			- **rw-** — права на чтение и запись, но без выполнения
			- **t** — установлен sticky-bit, а значит пользователи не могут удалить этот файл

# Информация по правам
- **Для кого права**
	- owner (владелец) — отдельный человек, который владеет файлом. Обычно это тот, кто создал файл, но владельцем можно сделать и кого-то другого
	- group (группа) — пользователи с общими заданными правами
	- others (другие) — все остальные пользователи, не относящиеся к группе и не являющиеся владельцами
- **Какие права**
	- - — нет прав, совсем
	- r — read (чтение) — право просматривать содержимое файла
	- w — write (запись) — право изменять содержимое файла
	- x — execute (выполнение) — право запускать файл, если это программа или скрипт и читать файлы, если папка
	- **Численная запись**
		- ![](pasted%20image%200.png)
		- 755
			- у владельца — все права
			- у группы — нет только права на запись
			- у остальных — нет только права на запись

#usergate 

- Запрещенные к домену не позднее даты (выбрать сегодня)
	-  `(action = 'deny') AND (domain = 'yandex.ru') AND date >= 2023-10-02T00:00:00`
- Один день от IP к домену
	- `date >= 2023-10-02T00:00:00 AND date <= 2023-10-02T23:59:59 AND (domain = 'yandex.ru') AND (ipSource = '10.15.94.31')`
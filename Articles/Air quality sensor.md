#diy
## ИКЕА ВИНДРИКТНИНГ
- Купить
	- https://market.yandex.ru/product--vindriktning/1777252022
- Переделка на ZigBee
	- habr.com/ru/amp/publications/773546/
	- Докупаем esp8266 или аналог 
		- Припаиваем три провода, на esp накатываем tasmota прям через браузер и получаем умный pm2.5 датчик с wifi и подключением к home assistance
		- ![|300](12647751_1.webp)

## Датчик CO2 своими руками
- Инструкция
	- https://github.com/NicoDupont/esp_ikea_vindriktning
- Компоненты
	- ESP-01S
		- https://aliexpress.ru/item/1005004968853289.html
	- Датчики
		- Датчик температуры и влажности BME280 (3,3 в)
			- https://aliexpress.ru/item/1005005616221865.html
		- Датчик CO MICS-5524
			- https://aliexpress.ru/item/1005006026275041.html
		- Датчик CO2 CCS811
			- https://aliexpress.ru/item/1005002303050387.html
	- Электропитание
		- Модуль питания AMS1117 3,3 в
			- https://aliexpress.ru/item/1005004871263507.html
		- Модуль питания ADS1115 5 в
			- https://aliexpress.ru/item/32672594709.html
		- Двухканальный логический преобразователь 5 в <> 3,3 в
			- https://aliexpress.ru/item/1972789887.html
- Схема
	- ![|600](12657541_1.webp)
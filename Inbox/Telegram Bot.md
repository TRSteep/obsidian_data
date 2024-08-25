#dev #python

# Телеграм бот
## Info
- Telegram API
	- https://core.telegram.org/bots/api#reactiontype

## Создание бота
- Регистрация бота
	- пишем боту @BotFather команду `/newbot`
	- после этого даем боту **имя** (любое) и **тэг** (нельзя изменить потом).
	- бот отправит нам **токен**, который никому давать нельзя.

## Редактирование бота
- Команды
	- пишем боту @BotFather
		- `/myBots`
	- дальше кнопка «**Edit Bot**»
	- дальше кнопка «**Edit Commands**»
- Оплата
	- пишем боту @BotFather

# Develop
## Prepare
Установка окружения для запуска бота
```bash
sudo apt-get install python3
# python3 is already the newest version (3.11.2-1+b1)
sudo apt-get install python3-pip
```
Ошибка error: externally-managed-environment
```bash
sudo apt install python3-venv
python3 -m venv .venv
source .venv/bin/activate
pip install cowsay
# после этого устанавливаем пакет
pip install cowsay
# Можно также не устанавливать виртуальную среду а просто установить пакет с тегом
pip install cowsay --break-system-package
```
В этом случае, вы устанавливаете пакет для всей системы а не для одного проекта, но это может негативно отразиться на системе в целом. Подробнее читаем по ссылке [PEP-0668](https://peps.python.org/pep-0668/)

Установка плагина в окружение
```bash
pip install pytelegrambotapi
pip install loguru
```

## Coding
- Подключение токена
```python
import telebot
bot = telebot.TeleBot('BOT-TOKEN')
```
- Вместо BOT-TOKEN пишем токен, который получили от BotFather



#vpn 

## Info
- https://ingeniare.space/it/vpn-na-3x-ui-bez-docker/
## Sources
- https://github.com/MHSanaei/3x-ui
# Install
- `apt update && apt upgrade -y`
- `bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)`
# Configure
- Панель управления 3X-UI находится по адресу: http://yourip:2053 (или ваш порт)
- Получаем SSL на панель
	- x-ui
	- Выбираем пункт 15 и когда попроси, вводим наш домен, к которому прилинкован IP сервера

- https://wiki.iphoster.net/wiki/Shadowsocks_cloak_-_%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_vpn_%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80%D0%B0_%D1%81_%D0%BE%D0%B1%D1%84%D1%83%D1%81%D0%BA%D0%B0%D1%86%D0%B8%D0%B5%D0%B9_%D1%82%D1%80%D0%B0%D1%84%D0%B8%D0%BA%D0%B0_%D0%B7%D0%B0_3_%D0%BC%D0%B8%D0%BD%D1%83%D1%82%D1%8B
- https://github.com/HirbodBehnam/Shadowsocks-Cloak-Installer
- https://iamninja.ru/2022/04/22/%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-shadowsockscloak/
- https://github.com/HirbodBehnam/Shadowsocks-Cloak-Installer

Архитектура работы через Shadowsocks + cloak плагин
- Shadowsocks server --> cloak plugin server side (443 port) -- cloak plugin client side (443 port) <--- Shadowsocks client
- Трафик маскируется под обычный просмотр веб-страниц на 443 порту https.
- На стороне клиента и сервера 443 порт не должен быть занят (не должны стоять веб-сервера).

Установка
- `curl -o Cloak-Installer.sh -L https://git.io/fj5mh && bash Cloak-Installer.sh`
- На выходе будут получены данные, которые нужно прописать в Shadowsocks клиенте
Настройка
- Импортировать конфиг Shadowsocks+cloak можно через автоматически сгенерированную ссылку ss://
-  Для этого в клиенте Shadowsocks - нужно включить "Ассоциированный ss:// ссылки". 
- Скопировать выданную ссылку в браузер и открыть в Shadowsocks
- Все настройки будут импортированы автоматически в клиент Shadowsocks на Windows
	- ![](494px-Shadowsocks-cloak-3.png)

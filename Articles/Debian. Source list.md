#debian
## Location
- Edit sources
	- `nano /etc/apt/sources.list`
- Typical sources for debian 12
```
deb ftp.am.debian.org/debian/ bookworm main contrib non-free
deb-src ftp.am.debian.org/debian/ bookworm main contrib non-free
```
- add sources with IP from bash
	- `echo "deb http://128.30.2.26/debian testing main contrib" > /etc/apt/sources.list`

---
# Описание
Содержимое этого файла обычно имеет следующий формат
```
deb http://site.example.com/debian distribution component1 component2 component3
deb-src http://site.example.com/debian distribution component1 component2 component3
```
- Первое слово в каждой строке - Тип архива
	- Deb указывает что архив содержит бинарные пакеты (deb)
	- Deb-src указывает что это архив пакетов с иходным кодом, который содержит оригинальные исходные коды программ
- URL Репозитория
	- Основной список зеркал
		- https://www.debian.org/mirror/list
- Дистрибутив
	- либо кодовое имя (jessie, stretch, buster, sid) или класс релиза (stable, oldstable, testing, unstable)
		- Например, если у вас есть система работающая на Debian 12.1 "bookworm" и вы не хотите обновляться когда выйдет Debian "trixie", в таком случае нужно использовать "bookworm" вместо "trixie"
		- Если вы всегда хотите помогать с тестированием дистрибутива, то используйте "testing"
- Компонент
	- **main** состоит из DFSG-compliant пакетов, которым не требуется другое ПО из других зон. Эти пакеты считаются частью дистрибуции Debian
	- **contrib** пакеты содержат DFSG-compliant ПО, но у них зависимостей из зоны main (возможно упакованы в non-free). 
	- **non-free** содержит ПО, которое не соответствует DFSG. 
	- Если хотите использовать только бесплатные:  main
	- Если вы хотите подключить репозиторий с несвободными компонентами системы, то добавьте contrib non-free после main
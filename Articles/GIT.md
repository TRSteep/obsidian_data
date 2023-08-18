#git #dev 
## Новый Репозиторий
- New Repo
	- `cd [Path]`
	- `git init`
	- `git add .`
	- `git commit -m "first commit"`
	- `git branch -M main`
	- `git remote add origin https://github.com/TRSteep/testdrive.git`
	- `git push -u origin main`
- Clone from Web
	- https://github.com/new
	- `git clone git@github.com:TRSteep/obsidian.git`
- Статус
	- `git status`
	- `git log`

## Работа с текущим репозитарием 
- Diff
	- `git diff`
- Pull
	- `git pull`
- Добавление файла-ов
	- `git add .`
	- `git add 1.js`
- Commit
	- `git commit -m "Added something"`
	- `git push`

![[Articles/Untitled Diagram.svg]]

## Ветка разработки
- Создание релизов уберегает от вливания непроверенного кода в мастер, потому что если вы будете вливать в мастер из девелопа, то кто-то может успеть влить новый коммит в develop, вы смерджите это в мастер и все отломается
- `git checkout -b develop`
	- создание ветки и сразу переход на нее
- `git push`

## Ветка фич
- вы отделяете новый функционал от основной ветки и этим самым упрощаете его проверку и вы можете в любой момент его померджить либо сделать это позже
- `git checkout -b feature/something`
	- создание ветки и сразу переход на нее
- `git add .`
	- Добавление файлов
- `git commit -m "Added feature"`
	- фиксация изменений
- `git push`
	- отправка на сервер
- ### Объединение фич и develop
	- `git checkout develop`
		- Переключение ветки
	- `git merge feature/implementing-auth`
		- мерджим нашу фичу в develop
	- `git push`
		- отправка на сервер

## Основная ветка
- Обьединение в основную ветку
- `git checkout -b release/1.0`
- `git checkout master`
- `git push`

---
## Игнорирование индексирования
- .gitignore
	- в корневом каталоге репозитория
	- `**/logs` - две звездочки - каталоги в любом месте репозитория
	- `*.log` - одна звездочка - может соответствовать как нескольким символам
	- `!important.log` - восклицательный знак отменяет действие шаблона
	- `/debug.log` - Косая черта перед именем файла соответствует файлу в корневом каталоге репозитория
	- `debug.log` - соответствуют файлам, находящимся в любом каталоге
	- https://www.atlassian.com/ru/git/tutorials/saving-changes/gitignore
- Удаление из кеша
	- `git rm --cached <имя-файла>`
		- удаление файла
	- `git rm -r --cached .`
		-  `git rm -r --cached . -f`
		- удаление всего кеша
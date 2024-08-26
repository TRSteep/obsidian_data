#docker #commands #workflow #examples

## Запуск контейнеров
- ```docker run --name test -i -t hello```
	- --name используется для установки имени запущенного контейнера
	- -i и -t указывают, что для запуска контейнера будет использоваться стандартный поток ввода и терминал TTY соответственно
- Для того чтобы при запуске контейнера примонтировать том, который будет связан с папкой на вашем компьютере
	- ```docker run -t -i --mount type=bind,src=/data,dst=/data hello bash```

## Управление образами
- список всех доступных локально образов
	- ```docker image ls```
- загрузка образа с именем hello **из** реестра
	- ```docker image pull hello```
- отправка образа с именем hello **в** реестр
	- ```docker image push hello```
- полная информация о контейнере hello
	- ```docker image inspect hello```
- собрать контейнер из текущей папки с учётом Dockerfile
	- ```docker image build```

## Управление контейнерами
- запуск контейнера
	- ```docker container start```
- перезапуск контейнера
	- ```docker container restart```
- постановка контейнера на паузу
	- ```docker container pause```
- остановка контейнера
	- ```docker container stop```

## Управление томами
- вывод всех томов
	- ```docker volume ls```
- вывод всех томов с фильтрацией по имени, например, hello
	- ``docker volume ls -f name=hello``
- создание нового тома, например, hello
	- ``docker volume create hello``
- исчерпывающая информация о томе
	- ``docker volume inspect hello```
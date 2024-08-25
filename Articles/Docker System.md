#docker 
![[1-1800w.webp]]
# Workflow
- В одном контейнере должен находится один процесс
- Контейнеры полностью изолированы от хостовой ОС и других контейнеров
- Контейнеры хранятся в виде папок и файлов в директории /var/lib/docker/containers
- Контейнерам могут быть назначены внешние порты инструкцией EXPOSE и ключом -P команды docker run
- Контейнеры могут сохранять информацию после уничтожения в томах Docker volume

# Theory
![](521.png)
![](523.png)
* **Docker host** — это операционная система, на которую устанавливают Docker
* **Docker daemon** — служба, которая управляет Docker-объектами: сетями, хранилищами, образами и контейнерами.
* Docker Network - виртуальная локальная сеть
	* `bridge` — когда контейнеры могут взаимодействовать между собой как веб-сервер и база данных
	* `host` — для доступа к локальному сетевому окружению на вашем компьютере
	* `none` — сеть для контейнеров полностью отключена
* **Docker Registry** — репозиторий, в котором хранятся образы.
	* Он может быть как локальным, так и публичным.
	* образы с описанием, разными версиями и тегами
* **Docker image** — это неизменяемый образ, из которого разворачивается контейнер
	* Это шаблон, по которому создают контейнеры
	* Похож на слоеный пирог:
		* мы накладываем слой файловой системы поверх слоя базового образа и получаем неизменяемый образ.
		* В него можно установить приложение, конфигурации и зависимости.
		* Другие образы могут наследоваться, поэтому если положить сверху слой файлов и закоммитить, то мы получим ещё один неизменяемый образ.
* **Dockerfile** — файл-инструкция для сборки образа.
	* рецепт приготовления Docker image
	* в файле описаны основные инструкции для сборки образа: какой базовый образ взять, откуда и куда положить файлы и так далее.
* **Docker container** — развёрнутое и запущенное приложение.
	* приложение, которое мы развернули с помощью Docker
	* аналогию: образ — это инсталлятор программы, а контейнер — уже запущенная программа.
	* При развёртывании контейнера поверх файловой системы создаётся ещё один изменяемый слой. Приложение внутри контейнера может записывать туда данные или редактировать их. После удаления контейнера данные стираются, но их можно сохранить с помощью ** volumes **
* **Docker Compose** — инструмент для управления несколькими контейнерами. Он позволяет создавать контейнеры и задавать их конфигурацию.
* **Оркестратор** - механизмов управления и распределения ресурсов, резервирования и отказоустойчивости
	* можно реализовывать разные схемы обновления контейнеров
	* [Kubernetes](https://kubernetes.io/)
	* [OpenShift](https://www.redhat.com/en/technologies/cloud-computing/openshift)
* **Docker Hub (реестр)**
	- https://hub.docker.com/
	*  [Google Cloud Container Registry](https://cloud.google.com/container-registry);
	- [Azure Container Registry](https://azure.microsoft.com/services/container-registry);
	- [IBM Cloud Container Registry](https://www.ibm.com/cloud/container-registry);
	- [Oracle Cloud Infrastructure Container Registry](https://www.oracle.com/cloud-native/container-registry/);
	- [Yandex Container Registry](https://cloud.yandex.com/services/container-registry).
	- Официальные образа
		- [Node](https://hub.docker.com/_/node);
		- [Express with compatible of MongoDB](https://hub.docker.com/_/mongo-express);
		- [Drupal](https://hub.docker.com/_/drupal);
		- [Python](https://hub.docker.com/_/python);
		- [PHP](https://hub.docker.com/_/php);
		- [Ruby](https://hub.docker.com/_/ruby).
- **Docker CLI** - консольный клиент
	- [docker ps](https://docs.docker.com/engine/reference/commandline/ps/);
	- [docker run](https://docs.docker.com/engine/reference/commandline/run/);
	- [docker image](https://docs.docker.com/engine/reference/commandline/image/);
	- [docker container](https://docs.docker.com/engine/reference/commandline/container/);
	- [docker volume](https://docs.docker.com/storage/volumes/).
---
![[types-of-mounts-volume.png]]